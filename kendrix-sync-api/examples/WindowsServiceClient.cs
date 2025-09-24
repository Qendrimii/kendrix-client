using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Timers;

namespace KendrixSyncClient
{
    public class SyncService
    {
        private readonly HttpClient _httpClient;
        private readonly string _apiBaseUrl;
        private readonly string _jwtToken;
        private readonly string _tenantKey;
        private readonly Timer _syncTimer;
        private readonly object _lockObject = new object();

        public SyncService(string apiBaseUrl, string jwtToken, string tenantKey)
        {
            _apiBaseUrl = apiBaseUrl.TrimEnd('/');
            _jwtToken = jwtToken;
            _tenantKey = tenantKey;

            _httpClient = new HttpClient();
            _httpClient.DefaultRequestHeaders.Add("Authorization", $"Bearer {_jwtToken}");
            _httpClient.DefaultRequestHeaders.Add("X-Tenant-External-Key", _tenantKey);

            // Set up timer for periodic sync (every 5 minutes)
            _syncTimer = new Timer(TimeSpan.FromMinutes(5).TotalMilliseconds);
            _syncTimer.Elapsed += OnSyncTimerElapsed;
        }

        public void Start()
        {
            _syncTimer.Start();
            Console.WriteLine("Sync service started. Press any key to stop.");
        }

        public void Stop()
        {
            _syncTimer.Stop();
            _httpClient?.Dispose();
            Console.WriteLine("Sync service stopped.");
        }

        private async void OnSyncTimerElapsed(object sender, ElapsedEventArgs e)
        {
            try
            {
                await PerformSync();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Sync error: {ex.Message}");
            }
        }

        private async Task PerformSync()
        {
            lock (_lockObject)
            {
                Console.WriteLine($"Starting sync at {DateTime.Now}");
            }

            // Example: Sync Fatura table
            await SyncTable("Fatura", GetFaturaData());
            
            // Example: Sync ArtikulliBaze table
            await SyncTable("ArtikulliBaze", GetArtikulliBazeData());
        }

        private async Task SyncTable(string tableName, List<Dictionary<string, object>> data)
        {
            if (data.Count == 0) return;

            var idempotencyKey = $"{DateTime.Now:yyyyMMdd-HHmmss}-{tableName}-{Guid.NewGuid():N}";
            
            var request = new
            {
                table = tableName,
                fromVersion = 1000, // This should come from your data source
                toVersion = 1001,   // This should come from your data source
                rows = data
            };

            var json = JsonSerializer.Serialize(request, new JsonSerializerOptions
            {
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase
            });

            var content = new StringContent(json, Encoding.UTF8, "application/json");
            _httpClient.DefaultRequestHeaders.Remove("X-Idempotency-Key");
            _httpClient.DefaultRequestHeaders.Add("X-Idempotency-Key", idempotencyKey);

            try
            {
                var response = await _httpClient.PostAsync($"{_apiBaseUrl}/api/sync/v1/batch", content);
                var responseContent = await response.Content.ReadAsStringAsync();

                if (response.IsSuccessStatusCode)
                {
                    var result = JsonSerializer.Deserialize<SyncResult>(responseContent);
                    Console.WriteLine($"Sync successful for {tableName}: {result.Accepted} accepted, {result.Skipped} skipped, {result.Errors} errors");
                }
                else
                {
                    Console.WriteLine($"Sync failed for {tableName}: {response.StatusCode} - {responseContent}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Sync error for {tableName}: {ex.Message}");
            }
        }

        // Example data generation methods - replace with your actual data source
        private List<Dictionary<string, object>> GetFaturaData()
        {
            // This is just example data - replace with your actual data retrieval logic
            return new List<Dictionary<string, object>>
            {
                new Dictionary<string, object>
                {
                    ["Id"] = 123,
                    ["op"] = "upsert",
                    ["Data"] = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss.fffZ"),
                    ["NrFatures"] = $"F-{DateTime.Now:yyyyMMdd-HHmmss}",
                    ["SubjektiId"] = 456,
                    ["Fshire"] = 0,
                    ["DataEKrijimit"] = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss.fffZ"),
                    ["DataEModifikimit"] = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
                }
            };
        }

        private List<Dictionary<string, object>> GetArtikulliBazeData()
        {
            // This is just example data - replace with your actual data retrieval logic
            return new List<Dictionary<string, object>>
            {
                new Dictionary<string, object>
                {
                    ["Id"] = 789,
                    ["op"] = "upsert",
                    ["Artikull"] = 1,
                    ["Sherbim"] = 0,
                    ["Shifra"] = "ART-001",
                    ["Emri"] = "Sample Product",
                    ["Njesia"] = "Cope",
                    ["Cmimi_I_Shitjes_Cope"] = 10.50m,
                    ["Aktiv"] = 1,
                    ["DataEKrijimit"] = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss.fffZ"),
                    ["DataEModifikimit"] = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss.fffZ")
                }
            };
        }

        public class SyncResult
        {
            public int Accepted { get; set; }
            public int Skipped { get; set; }
            public int Errors { get; set; }
            public bool Duplicate { get; set; }
        }
    }

    // Example Windows Service implementation
    public class KendrixSyncWindowsService : System.ServiceProcess.ServiceBase
    {
        private SyncService _syncService;

        protected override void OnStart(string[] args)
        {
            // Configuration - these should come from app.config or environment variables
            var apiBaseUrl = "https://your-api-domain.com";
            var jwtToken = "your-jwt-token-here";
            var tenantKey = "your-tenant-external-key";

            _syncService = new SyncService(apiBaseUrl, jwtToken, tenantKey);
            _syncService.Start();
        }

        protected override void OnStop()
        {
            _syncService?.Stop();
        }
    }
}

