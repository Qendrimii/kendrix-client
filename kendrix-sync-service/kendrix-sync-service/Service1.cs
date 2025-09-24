using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using System.Configuration;
using kendrix_sync_service.Services;

namespace kendrix_sync_service
{
    public partial class Service1 : ServiceBase
    {
        private Timer _timer;
        private SyncService _syncService;
        private bool _isRunning = false;
        private EventLog _eventLog;

        public Service1()
        {
            InitializeComponent();
            _eventLog = new EventLog();
            _eventLog.Source = "Kendrix Sync Service";
        }

        protected override void OnStart(string[] args)
        {
            try
            {
                _eventLog.WriteEntry("Kendrix Sync Service starting...", EventLogEntryType.Information);

                _syncService = new SyncService();

                // Get sync interval from configuration
                var intervalMinutes = int.Parse(ConfigurationManager.AppSettings["KendrixApi.SyncIntervalMinutes"] ?? "5");
                var intervalMs = intervalMinutes * 60 * 1000;

                _timer = new Timer(intervalMs);
                _timer.Elapsed += OnTimerElapsed;
                _timer.AutoReset = true;
                _timer.Enabled = true;

                _eventLog.WriteEntry($"Kendrix Sync Service started. Sync interval: {intervalMinutes} minutes", EventLogEntryType.Information);
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error starting Kendrix Sync Service: {ex.Message}", EventLogEntryType.Error);
                throw;
            }
        }

        protected override void OnStop()
        {
            try
            {
                _eventLog.WriteEntry("Kendrix Sync Service stopping...", EventLogEntryType.Information);

                _isRunning = false;
                _timer?.Stop();
                _timer?.Dispose();
                _syncService?.Dispose();

                _eventLog.WriteEntry("Kendrix Sync Service stopped", EventLogEntryType.Information);
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error stopping Kendrix Sync Service: {ex.Message}", EventLogEntryType.Error);
            }
        }

        private async void OnTimerElapsed(object sender, ElapsedEventArgs e)
        {
            if (_isRunning)
            {
                _eventLog.WriteEntry("Previous sync operation still running, skipping this cycle", EventLogEntryType.Warning);
                return;
            }

            _isRunning = true;

            try
            {
                var enableSync = bool.Parse(ConfigurationManager.AppSettings["SyncSettings.EnableSync"] ?? "true");
                
                if (!enableSync)
                {
                    _eventLog.WriteEntry("Sync is disabled in configuration", EventLogEntryType.Information);
                    return;
                }

                _eventLog.WriteEntry("Starting scheduled sync process...", EventLogEntryType.Information);
                
                var success = await _syncService.SyncAllTablesAsync();
                
                if (success)
                {
                    _eventLog.WriteEntry("Scheduled sync process completed successfully", EventLogEntryType.Information);
                }
                else
                {
                    _eventLog.WriteEntry("Scheduled sync process completed with errors", EventLogEntryType.Warning);
                }
            }
            catch (Exception ex)
            {
                _eventLog.WriteEntry($"Error during scheduled sync: {ex.Message}", EventLogEntryType.Error);
            }
            finally
            {
                _isRunning = false;
            }
        }
    }
}
