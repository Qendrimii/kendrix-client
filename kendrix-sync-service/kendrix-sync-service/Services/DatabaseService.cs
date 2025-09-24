using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Threading.Tasks;
using System.Configuration;
using System.Diagnostics;
using kendrix_sync_service.Models;

namespace kendrix_sync_service.Services
{
    public class DatabaseService
    {
        private readonly string _connectionString;
        private readonly EventLog _eventLog;

        public DatabaseService()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            _eventLog = new EventLog();
            _eventLog.Source = "Kendrix Sync Service";
        }

        public async Task<List<T>> GetDataAsync<T>(string tableName, long fromVersion = 0) where T : BaseEntity, new()
        {
            var results = new List<T>();
            
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    // Handle invalid dates by using ISNULL for WHERE clause
                    var query = $"SELECT * FROM {tableName} WHERE ISNULL(DataEModifikimit, '1900-01-01') > @FromVersion ORDER BY ISNULL(DataEModifikimit, '1900-01-01')";
                    
                    using (var command = new SqlCommand(query, connection))
                    {
                        // Handle the case where fromVersion is 0 (use a very old date instead of DateTime.FromBinary(0))
                        var fromDate = fromVersion == 0 ? new DateTime(1900, 1, 1) : DateTime.FromBinary(fromVersion);
                        command.Parameters.AddWithValue("@FromVersion", fromDate);

                        using (var reader = await command.ExecuteReaderAsync())
                        {
                            while (await reader.ReadAsync())
                            {
                                var entity = MapEntity<T>(reader);
                                results.Add(entity);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error retrieving data from table {tableName}: {ex.Message}", EventLogEntryType.Error);
                throw;
            }

            return results;
        }

        public async Task<long> GetLastVersionAsync(string tableName)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    // Use ISNULL to handle potential null values in DataEModifikimit
                    var query = $"SELECT MAX(ISNULL(DataEModifikimit, '1900-01-01')) FROM {tableName}";
                    
                    using (var command = new SqlCommand(query, connection))
                    {
                        var result = await command.ExecuteScalarAsync();
                        
                        if (result == null || result == DBNull.Value)
                            return 0;

                        var dateTime = (DateTime)result;
                        // Ensure the date is within SQL Server's valid range
                        if (dateTime < new DateTime(1753, 1, 1))
                            return 0;
                            
                        return dateTime.ToBinary();
                    }
                }
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error getting last version for table {tableName}: {ex.Message}", EventLogEntryType.Error);
                return 0;
            }
        }

        public async Task SaveSyncVersionAsync(string tableName, long version)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    // Create sync_versions table if it doesn't exist
                    await CreateSyncVersionsTableAsync(connection);

                    var query = @"
                        MERGE SyncVersions AS target
                        USING (SELECT @TableName AS TableName, @Version AS LastVersion, @LastSync AS LastSyncTime) AS source
                        ON target.TableName = source.TableName
                        WHEN MATCHED THEN
                            UPDATE SET LastVersion = source.LastVersion, LastSyncTime = source.LastSyncTime
                        WHEN NOT MATCHED THEN
                            INSERT (TableName, LastVersion, LastSyncTime) VALUES (source.TableName, source.LastVersion, source.LastSyncTime);";

                    using (var command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@TableName", tableName);
                        command.Parameters.AddWithValue("@Version", version);
                        command.Parameters.AddWithValue("@LastSync", DateTime.UtcNow);

                        await command.ExecuteNonQueryAsync();
                    }
                }
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error saving sync version for table {tableName}: {ex.Message}", EventLogEntryType.Error);
                throw;
            }
        }

        public async Task<long> GetSyncVersionAsync(string tableName)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    // Create sync_versions table if it doesn't exist
                    await CreateSyncVersionsTableAsync(connection);

                    var query = "SELECT LastVersion FROM SyncVersions WHERE TableName = @TableName";
                    
                    using (var command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@TableName", tableName);

                        var result = await command.ExecuteScalarAsync();
                        return result != null ? (long)result : 0;
                    }
                }
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error getting sync version for table {tableName}: {ex.Message}", EventLogEntryType.Error);
                return 0;
            }
        }

        private async Task CreateSyncVersionsTableAsync(SqlConnection connection)
        {
            var createTableQuery = @"
                IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SyncVersions' AND xtype='U')
                CREATE TABLE SyncVersions (
                    TableName NVARCHAR(64) PRIMARY KEY,
                    LastVersion BIGINT NOT NULL DEFAULT 0,
                    LastSyncTime DATETIME2 NOT NULL DEFAULT GETUTCDATE()
                )";

            using (var command = new SqlCommand(createTableQuery, connection))
            {
                await command.ExecuteNonQueryAsync();
            }
        }

        private T MapEntity<T>(IDataReader reader) where T : BaseEntity, new()
        {
            var entity = new T();
            var properties = typeof(T).GetProperties();

            foreach (var property in properties)
            {
                try
                {
                    var columnName = property.Name;
                    var ordinal = reader.GetOrdinal(columnName);
                    
                    if (reader.IsDBNull(ordinal))
                    {
                        if (property.PropertyType.IsValueType && Nullable.GetUnderlyingType(property.PropertyType) == null)
                        {
                            // Handle non-nullable value types
                            continue;
                        }
                        property.SetValue(entity, null);
                    }
                    else
                    {
                        try
                        {
                            var value = reader.GetValue(ordinal);
                            
                            // Handle type conversions
                            if (property.PropertyType == typeof(bool?) && value is bool boolValue)
                            {
                                property.SetValue(entity, boolValue);
                            }
                            else if (property.PropertyType == typeof(DateTime?) && value is DateTime dateValue)
                            {
                                // Check if the DateTime value is within the valid range
                                if (dateValue >= new DateTime(1753, 1, 1) && dateValue <= new DateTime(9999, 12, 31))
                                {
                                    property.SetValue(entity, dateValue);
                                }
                                else
                                {
                                    // Set to null for invalid dates
                                    property.SetValue(entity, null);
                                    _eventLog.WriteEntry($"Invalid DateTime value {dateValue} in property {property.Name} for entity {typeof(T).Name}. Setting to null.", EventLogEntryType.Warning);
                                }
                            }
                            else if (property.PropertyType == typeof(decimal?) && value is decimal decimalValue)
                            {
                                property.SetValue(entity, decimalValue);
                            }
                            else if (property.PropertyType == typeof(int?) && value is int intValue)
                            {
                                property.SetValue(entity, intValue);
                            }
                            else if (property.PropertyType == typeof(string) && value is string stringValue)
                            {
                                property.SetValue(entity, stringValue);
                            }
                            else if (property.PropertyType == typeof(byte[]) && value is byte[] byteArrayValue)
                            {
                                property.SetValue(entity, byteArrayValue);
                            }
                            else
                            {
                                property.SetValue(entity, Convert.ChangeType(value, property.PropertyType));
                            }
                        }
                        catch (System.Data.SqlTypes.SqlTypeException sqlEx)
                        {
                            // Handle SqlDateTime overflow specifically
                            if (property.PropertyType == typeof(DateTime?))
                            {
                                property.SetValue(entity, null);
                                _eventLog.WriteEntry($"SqlDateTime overflow in property {property.Name} for entity {typeof(T).Name}. Setting to null. Error: {sqlEx.Message}", EventLogEntryType.Warning);
                            }
                            else
                            {
                                _eventLog.WriteEntry($"SQL type error mapping property {property.Name} for entity {typeof(T).Name}: {sqlEx.Message}", EventLogEntryType.Warning);
                            }
                        }
                        catch (InvalidCastException castEx)
                        {
                            _eventLog.WriteEntry($"Cast error mapping property {property.Name} for entity {typeof(T).Name}: {castEx.Message}", EventLogEntryType.Warning);
                        }
                    }
                }
                catch (Exception ex)
                {
                    _eventLog.WriteEntry($"Error mapping property {property.Name} for entity {typeof(T).Name}: {ex.Message}", EventLogEntryType.Warning);
                }
            }

            return entity;
        }
    }
}