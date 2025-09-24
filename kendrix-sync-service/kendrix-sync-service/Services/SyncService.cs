using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Configuration;
using System.Diagnostics;
using kendrix_sync_service.Models;
using Newtonsoft.Json;

namespace kendrix_sync_service.Services
{
    public class SyncService
    {
        private readonly DatabaseService _databaseService;
        private readonly ApiService _apiService;
        private readonly EventLog _eventLog;
        private readonly int _batchSize;

        // Table sync order based on foreign key dependencies
        private readonly string[] _syncOrder = {
            "Subjektet",
            "TVSH",
            "Kategoria",
            "ArtikulliBaze",
            "Shfrytezuesi",
            "FaturaKategoria",
            "BlerjeKategoria",
            "MenyraPageses",
            "Pagesat",
            "Fatura",
            "Porosia",
            "Blerjet",
            "PorositeEBlerjes",
            "Stoku",
            "Normativa",
            "ZRaportet"
        };

        public SyncService()
        {
            _databaseService = new DatabaseService();
            _apiService = new ApiService(new JwtService(ConfigurationManager.AppSettings["KendrixApi.JwtSecret"]));
            _eventLog = new EventLog();
            _eventLog.Source = "Kendrix Sync Service";
            _batchSize = int.Parse(ConfigurationManager.AppSettings["KendrixApi.BatchSize"] ?? "100");
        }

        public async Task<bool> SyncAllTablesAsync()
        {
            try
            {
                _eventLog.WriteEntry("Starting sync process for all tables", EventLogEntryType.Information);

                // Test API connection first
                if (!await _apiService.TestConnectionAsync())
                {
                    _eventLog.WriteEntry("API connection test failed", EventLogEntryType.Error);
                    return false;
                }

                var success = true;
                var syncResults = new Dictionary<string, bool>();

                foreach (var tableName in _syncOrder)
                {
                    try
                    {
                        _eventLog.WriteEntry($"Syncing table: {tableName}", EventLogEntryType.Information);
                        var result = await SyncTableAsync(tableName);
                        syncResults[tableName] = result;
                        
                        if (!result)
                        {
                            success = false;
                            _eventLog.WriteEntry($"Failed to sync table: {tableName}", EventLogEntryType.Warning);
                        }
                        else
                        {
                            _eventLog.WriteEntry($"Successfully synced table: {tableName}", EventLogEntryType.Information);
                        }
                    }
                    catch (Exception ex)
                    {
                        _eventLog.WriteEntry($"Error syncing table {tableName}: {ex.Message}", EventLogEntryType.Error);
                        syncResults[tableName] = false;
                        success = false;
                    }
                }

                _eventLog.WriteEntry($"Sync process completed. Success: {success}", EventLogEntryType.Information);
                return success;
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error in sync process: {ex.Message}", EventLogEntryType.Error);
                return false;
            }
        }

        public async Task<bool> SyncTableAsync(string tableName)
        {
            try
            {
                var lastVersion = await _databaseService.GetSyncVersionAsync(tableName);
                var currentVersion = await _databaseService.GetLastVersionAsync(tableName);

                if (currentVersion <= lastVersion)
                {
                    _eventLog.WriteEntry($"No new data to sync for table: {tableName}", EventLogEntryType.Information);
                    return true;
                }

                _eventLog.WriteEntry($"Syncing table {tableName} from version {lastVersion} to {currentVersion}", EventLogEntryType.Information);

                // Get data from database
                var data = await GetTableDataAsync(tableName, lastVersion);
                
                if (!data.Any())
                {
                    _eventLog.WriteEntry($"No data found for table: {tableName}", EventLogEntryType.Information);
                    await _databaseService.SaveSyncVersionAsync(tableName, currentVersion);
                    return true;
                }

                // Process data in batches
                var batches = ChunkData(data, _batchSize);
                var allSuccessful = true;

                foreach (var batch in batches)
                {
                    var batchRequest = CreateBatchRequest(tableName, lastVersion, currentVersion, batch.ToList());
                    var response = await _apiService.SendBatchAsync(batchRequest);

                    if (!response.Success || response.Errors > 0)
                    {
                        _eventLog.WriteEntry($"Batch sync failed for table {tableName}. Errors: {response.Errors}, Details: {response.ErrorDetails}", EventLogEntryType.Error);
                        allSuccessful = false;
                    }
                    else
                    {
                        _eventLog.WriteEntry($"Batch sync successful for table {tableName}. Accepted: {response.Accepted}, Skipped: {response.Skipped}", EventLogEntryType.Information);
                    }
                }

                if (allSuccessful)
                {
                    await _databaseService.SaveSyncVersionAsync(tableName, currentVersion);
                }

                return allSuccessful;
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error syncing table {tableName}: {ex.Message}", EventLogEntryType.Error);
                return false;
            }
        }

        private async Task<List<Dictionary<string, object>>> GetTableDataAsync(string tableName, long fromVersion)
        {
            var data = new List<Dictionary<string, object>>();

            try
            {
                switch (tableName)
                {
                    case "Subjektet":
                        var subjektetData = await _databaseService.GetDataAsync<Subjektet>(tableName, fromVersion);
                        data = subjektetData.Select(ConvertToDictionary).ToList();
                        break;
                    case "TVSH":
                        var tvshData = await _databaseService.GetDataAsync<TVSH>(tableName, fromVersion);
                        data = tvshData.Select(ConvertToDictionary).ToList();
                        break;
                    case "Kategoria":
                        var kategoriaData = await _databaseService.GetDataAsync<Kategoria>(tableName, fromVersion);
                        data = kategoriaData.Select(ConvertToDictionary).ToList();
                        break;
                    case "ArtikulliBaze":
                        var artikulliData = await _databaseService.GetDataAsync<ArtikulliBaze>(tableName, fromVersion);
                        data = artikulliData.Select(ConvertToDictionary).ToList();
                        break;
                    case "Shfrytezuesi":
                        var shfrytezuesiData = await _databaseService.GetDataAsync<Shfrytezuesi>(tableName, fromVersion);
                        data = shfrytezuesiData.Select(ConvertToDictionary).ToList();
                        break;
                    case "FaturaKategoria":
                        var faturaKategoriaData = await _databaseService.GetDataAsync<FaturaKategoria>(tableName, fromVersion);
                        data = faturaKategoriaData.Select(ConvertToDictionary).ToList();
                        break;
                    case "BlerjeKategoria":
                        var blerjeKategoriaData = await _databaseService.GetDataAsync<BlerjeKategoria>(tableName, fromVersion);
                        data = blerjeKategoriaData.Select(ConvertToDictionary).ToList();
                        break;
                    case "MenyraPageses":
                        var menyraPagesesData = await _databaseService.GetDataAsync<MenyraPageses>(tableName, fromVersion);
                        data = menyraPagesesData.Select(ConvertToDictionary).ToList();
                        break;
                    case "Pagesat":
                        var pagesatData = await _databaseService.GetDataAsync<Pagesat>(tableName, fromVersion);
                        data = pagesatData.Select(ConvertToDictionary).ToList();
                        break;
                    case "Fatura":
                        var faturaData = await _databaseService.GetDataAsync<Fatura>(tableName, fromVersion);
                        data = faturaData.Select(ConvertToDictionary).ToList();
                        break;
                    case "Porosia":
                        var porosiaData = await _databaseService.GetDataAsync<Porosia>(tableName, fromVersion);
                        data = porosiaData.Select(ConvertToDictionary).ToList();
                        break;
                    case "Blerjet":
                        var blerjetData = await _databaseService.GetDataAsync<Blerjet>(tableName, fromVersion);
                        data = blerjetData.Select(ConvertToDictionary).ToList();
                        break;
                    case "PorositeEBlerjes":
                        var porositeEBlerjesData = await _databaseService.GetDataAsync<PorositeEBlerjes>(tableName, fromVersion);
                        data = porositeEBlerjesData.Select(ConvertToDictionary).ToList();
                        break;
                    case "Stoku":
                        var stokuData = await _databaseService.GetDataAsync<Stoku>(tableName, fromVersion);
                        data = stokuData.Select(ConvertToDictionary).ToList();
                        break;
                    case "Normativa":
                        var normativaData = await _databaseService.GetDataAsync<Normativa>(tableName, fromVersion);
                        data = normativaData.Select(ConvertToDictionary).ToList();
                        break;
                    case "ZRaportet":
                        var zRaportetData = await _databaseService.GetDataAsync<ZRaportet>(tableName, fromVersion);
                        data = zRaportetData.Select(ConvertToDictionary).ToList();
                        break;
                    default:
                        _eventLog.WriteEntry($"Unknown table: {tableName}", EventLogEntryType.Warning);
                        break;
                }
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error getting data for table {tableName}: {ex.Message}", EventLogEntryType.Error);
                throw;
            }

            return data;
        }

        private Dictionary<string, object> ConvertToDictionary<T>(T entity) where T : BaseEntity
        {
            var dictionary = new Dictionary<string, object>();
            
            // Add tenant_id (assuming tenant ID 1 for now)
            dictionary["tenant_id"] = 1;
            
            // Add operation type
            dictionary["op"] = "upsert";

            // Get all properties and convert to dictionary
            var properties = typeof(T).GetProperties();
            foreach (var property in properties)
            {
                var value = property.GetValue(entity);
                
                // Skip null values for optional fields
                if (value == null && property.PropertyType.IsGenericType && 
                    property.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>))
                {
                    continue;
                }

                // Convert DateTime to ISO string
                if (value is DateTime)
                {
                    var dateTime = (DateTime)value;
                    dictionary[property.Name] = dateTime.ToString("yyyy-MM-ddTHH:mm:ss.fffZ");
                }
                else if (value is DateTime?)
                {
                    var nullableDateTime = (DateTime?)value;
                    if (nullableDateTime.HasValue)
                    {
                        dictionary[property.Name] = nullableDateTime.Value.ToString("yyyy-MM-ddTHH:mm:ss.fffZ");
                    }
                }
                else
                {
                    dictionary[property.Name] = value ?? (object)string.Empty;
                }
            }

            return dictionary;
        }

        private BatchRequest CreateBatchRequest(string tableName, long fromVersion, long toVersion, List<Dictionary<string, object>> rows)
        {
            return new BatchRequest
            {
                Table = tableName,
                FromVersion = fromVersion,
                ToVersion = toVersion,
                Rows = rows
            };
        }

        private List<List<Dictionary<string, object>>> ChunkData(List<Dictionary<string, object>> data, int chunkSize)
        {
            var chunks = new List<List<Dictionary<string, object>>>();
            
            for (int i = 0; i < data.Count; i += chunkSize)
            {
                var chunk = data.Skip(i).Take(chunkSize).ToList();
                chunks.Add(chunk);
            }
            
            return chunks;
        }

        public void Dispose()
        {
            _apiService?.Dispose();
        }
    }
}