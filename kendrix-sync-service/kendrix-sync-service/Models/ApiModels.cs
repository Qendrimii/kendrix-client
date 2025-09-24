using System;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace kendrix_sync_service.Models
{
    public class BatchRequest
    {
        [JsonProperty("table")]
        public string Table { get; set; }

        [JsonProperty("fromVersion")]
        public long FromVersion { get; set; }

        [JsonProperty("toVersion")]
        public long ToVersion { get; set; }

        [JsonProperty("rows")]
        public List<Dictionary<string, object>> Rows { get; set; }

        public BatchRequest()
        {
            Rows = new List<Dictionary<string, object>>();
        }
    }

    public class BatchResponse
    {
        [JsonProperty("success")]
        public bool Success { get; set; }

        [JsonProperty("accepted")]
        public int Accepted { get; set; }

        [JsonProperty("skipped")]
        public int Skipped { get; set; }

        [JsonProperty("errors")]
        public int Errors { get; set; }

        [JsonProperty("duplicate")]
        public bool Duplicate { get; set; }

        [JsonProperty("error_details")]
        public string ErrorDetails { get; set; }

        [JsonProperty("timestamp")]
        public DateTime Timestamp { get; set; }
    }

    public class HealthResponse
    {
        [JsonProperty("status")]
        public string Status { get; set; }

        [JsonProperty("timestamp")]
        public DateTime Timestamp { get; set; }

        [JsonProperty("version")]
        public string Version { get; set; }

        [JsonProperty("php_version")]
        public string PhpVersion { get; set; }

        [JsonProperty("server_time")]
        public string ServerTime { get; set; }

        [JsonProperty("database")]
        public string Database { get; set; }

        [JsonProperty("endpoints")]
        public Dictionary<string, string> Endpoints { get; set; }

        public HealthResponse()
        {
            Endpoints = new Dictionary<string, string>();
        }
    }

    public class ContractResponse
    {
        [JsonProperty("success")]
        public bool Success { get; set; }

        [JsonProperty("data")]
        public ContractData Data { get; set; }

        [JsonProperty("timestamp")]
        public DateTime Timestamp { get; set; }

        public ContractResponse()
        {
            Data = new ContractData();
        }
    }

    public class ContractData
    {
        [JsonProperty("tables")]
        public List<TableInfo> Tables { get; set; }

        [JsonProperty("requiredHeaders")]
        public List<string> RequiredHeaders { get; set; }

        [JsonProperty("maxBodyBytes")]
        public int MaxBodyBytes { get; set; }

        [JsonProperty("ordering")]
        public List<string> Ordering { get; set; }

        public ContractData()
        {
            Tables = new List<TableInfo>();
            RequiredHeaders = new List<string>();
            Ordering = new List<string>();
        }
    }

    public class TableInfo
    {
        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("schemaHash")]
        public string SchemaHash { get; set; }

        [JsonProperty("maxRows")]
        public int MaxRows { get; set; }
    }

    public class SyncVersion
    {
        public string TableName { get; set; }
        public long LastVersion { get; set; }
        public DateTime LastSyncTime { get; set; }
    }
}

