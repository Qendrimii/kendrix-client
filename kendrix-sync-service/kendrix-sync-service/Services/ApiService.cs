using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Diagnostics;
using Newtonsoft.Json;
using kendrix_sync_service.Models;

namespace kendrix_sync_service.Services
{
    public class ApiService
    {
        private readonly HttpClient _httpClient;
        private readonly JwtService _jwtService;
        private readonly string _baseUrl;
        private readonly string _tenantKey;
        private readonly EventLog _eventLog;

        public ApiService(JwtService jwtService)
        {
            _httpClient = new HttpClient();
            _jwtService = jwtService;
            _baseUrl = ConfigurationManager.AppSettings["KendrixApi.BaseUrl"];
            _tenantKey = ConfigurationManager.AppSettings["KendrixApi.TenantKey"];
            _eventLog = new EventLog();
            _eventLog.Source = "Kendrix Sync Service";

            // Validate configuration
            if (string.IsNullOrEmpty(_baseUrl))
            {
                throw new InvalidOperationException("KendrixApi.BaseUrl configuration is missing or empty");
            }
            
            if (string.IsNullOrEmpty(_tenantKey))
            {
                throw new InvalidOperationException("KendrixApi.TenantKey configuration is missing or empty");
            }
            
            if (_tenantKey == "KENDRIX-CLIENT-001")
            {
                _eventLog.WriteEntry("Warning: Using default tenant key. Please configure a real tenant key for production.", EventLogEntryType.Warning);
            }

            _httpClient.BaseAddress = new Uri(_baseUrl);
            _httpClient.Timeout = TimeSpan.FromMinutes(5);
            
            // Ensure base URL ends with slash for proper URI combination
            if (!_baseUrl.EndsWith("/"))
            {
                _httpClient.BaseAddress = new Uri(_baseUrl + "/");
            }
        }

        public async Task<HealthResponse> GetHealthAsync()
        {
            try
            {
                // Clear any existing headers for health check (no auth needed)
                _httpClient.DefaultRequestHeaders.Clear();
                
                // Log the exact URL being called
                var fullUrl = new Uri(_httpClient.BaseAddress, "health.php").ToString();
                _eventLog.WriteEntry($"Calling health endpoint: {fullUrl}", EventLogEntryType.Information);
                
                var response = await _httpClient.GetAsync("health.php");
                
                _eventLog.WriteEntry($"Health endpoint response status: {response.StatusCode}", EventLogEntryType.Information);
                
                response.EnsureSuccessStatusCode();

                var content = await response.Content.ReadAsStringAsync();
                _eventLog.WriteEntry($"Health endpoint response content: {content.Substring(0, Math.Min(200, content.Length))}...", EventLogEntryType.Information);
                
                return JsonConvert.DeserializeObject<HealthResponse>(content) ?? new HealthResponse();
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error getting health status: {ex.Message}", EventLogEntryType.Error);
                throw;
            }
        }

        public async Task<ContractResponse> GetContractAsync()
        {
            try
            {
                // Clear headers and set auth headers for this request
                _httpClient.DefaultRequestHeaders.Clear();
                
                var token = _jwtService.GenerateToken();
                _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
                
                // Remove existing tenant header if present and add new one
                if (_httpClient.DefaultRequestHeaders.Contains("X-Tenant-External-Key"))
                {
                    _httpClient.DefaultRequestHeaders.Remove("X-Tenant-External-Key");
                }
                _httpClient.DefaultRequestHeaders.Add("X-Tenant-External-Key", _tenantKey);

                var response = await _httpClient.GetAsync("sync/v1/contract");
                response.EnsureSuccessStatusCode();

                var content = await response.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<ContractResponse>(content) ?? new ContractResponse();
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error getting contract information: {ex.Message}", EventLogEntryType.Error);
                throw;
            }
        }

        public async Task<BatchResponse> SendBatchAsync(BatchRequest request)
        {
            try
            {
                // Clear headers and set auth headers for this request
                _httpClient.DefaultRequestHeaders.Clear();
                
                var token = _jwtService.GenerateToken();
                _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
                
                // Add tenant header
                _httpClient.DefaultRequestHeaders.Add("X-Tenant-External-Key", _tenantKey);
                
                // Add idempotency header
                var idempotencyKey = $"{DateTime.UtcNow:yyyyMMddHHmmss}-{request.Table}-{Guid.NewGuid():N}";
                _httpClient.DefaultRequestHeaders.Add("X-Idempotency-Key", idempotencyKey);

                var json = JsonConvert.SerializeObject(request, Formatting.None, new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Ignore,
                    DateFormatHandling = DateFormatHandling.IsoDateFormat
                });

                var content = new StringContent(json, Encoding.UTF8, "application/json");

                var response = await _httpClient.PostAsync("sync/v1/batch", content);
                response.EnsureSuccessStatusCode();

                var responseContent = await response.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<BatchResponse>(responseContent) ?? new BatchResponse();
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error sending batch for table {request.Table}: {ex.Message}", EventLogEntryType.Error);
                throw;
            }
        }

        public async Task<bool> TestConnectionAsync()
        {
            try
            {
                _eventLog.WriteEntry("Testing API connection...", EventLogEntryType.Information);
                
                var health = await GetHealthAsync();
                var isConnected = health.Status == "ok" && health.Database == "connected";
                
                if (isConnected)
                {
                    _eventLog.WriteEntry("API connection test successful", EventLogEntryType.Information);
                }
                else
                {
                    _eventLog.WriteEntry($"API connection test failed - Status: {health.Status}, Database: {health.Database}", EventLogEntryType.Warning);
                }
                
                return isConnected;
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"API connection test failed with exception: {ex.Message}", EventLogEntryType.Error);
                return false;
            }
        }

        public void Dispose()
        {
            _httpClient?.Dispose();
        }
    }
}