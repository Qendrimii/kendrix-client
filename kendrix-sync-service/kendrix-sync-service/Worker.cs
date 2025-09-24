using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using KendrixSyncService.Services;

namespace KendrixSyncService
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;
        private readonly IServiceProvider _serviceProvider;
        private readonly IConfiguration _configuration;

        public Worker(ILogger<Worker> logger, IServiceProvider serviceProvider, IConfiguration configuration)
        {
            _logger = logger;
            _serviceProvider = serviceProvider;
            _configuration = configuration;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            _logger.LogInformation("Kendrix Sync Service started at: {Time}", DateTimeOffset.Now);

            while (!stoppingToken.IsCancellationRequested)
            {
                try
                {
                    var enableSync = _configuration.GetValue<bool>("SyncSettings:EnableSync", true);
                    
                    if (!enableSync)
                    {
                        _logger.LogDebug("Sync is disabled. Waiting...");
                        await Task.Delay(TimeSpan.FromMinutes(1), stoppingToken);
                        continue;
                    }

                    using var scope = _serviceProvider.CreateScope();
                    var syncService = scope.ServiceProvider.GetRequiredService<SyncService>();

                    _logger.LogInformation("Starting sync process...");
                    var success = await syncService.SyncAllTablesAsync();
                    
                    if (success)
                    {
                        _logger.LogInformation("Sync process completed successfully");
                    }
                    else
                    {
                        _logger.LogWarning("Sync process completed with errors");
                    }
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Error occurred during sync process");
                }

                var intervalMinutes = _configuration.GetValue<int>("KendrixApi:SyncIntervalMinutes", 5);
                _logger.LogDebug("Waiting {IntervalMinutes} minutes until next sync...", intervalMinutes);
                
                await Task.Delay(TimeSpan.FromMinutes(intervalMinutes), stoppingToken);
            }

            _logger.LogInformation("Kendrix Sync Service stopped at: {Time}", DateTimeOffset.Now);
        }

        public override async Task StartAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation("Kendrix Sync Service is starting...");
            await base.StartAsync(cancellationToken);
        }

        public override async Task StopAsync(CancellationToken cancellationToken)
        {
            _logger.LogInformation("Kendrix Sync Service is stopping...");
            await base.StopAsync(cancellationToken);
        }
    }
}
