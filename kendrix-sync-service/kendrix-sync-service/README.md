# Kendrix Sync Service

A Windows Service for automatically syncing data from a SQL Server database to the Kendrix API.

## Features

- **Automatic Sync**: Periodically syncs data from SQL Server to Kendrix API
- **Table Support**: Supports all 16 tables with proper dependency ordering
- **Batch Processing**: Processes data in configurable batches for efficiency
- **Error Handling**: Comprehensive error handling and logging
- **JWT Authentication**: Secure API communication using JWT tokens
- **Configurable**: Easy configuration through App.config

## Supported Tables

The service syncs the following tables in dependency order:

1. Subjektet
2. TVSH
3. Kategoria
4. ArtikulliBaze
5. Shfrytezuesi
6. FaturaKategoria
7. BlerjeKategoria
8. MenyraPageses
9. Pagesat
10. Fatura
11. Porosia
12. Blerjet
13. PorositeEBlerjes
14. Stoku
15. Normativa
16. ZRaportet

## Configuration

Edit `App.config` to configure the service:

### Database Connection
```xml
<connectionStrings>
    <add name="DefaultConnection" 
         connectionString="Data Source=.\SQLEXPRESS;Initial Catalog=pricaffe;Integrated Security=True;MultipleActiveResultSets=True;" 
         providerName="System.Data.SqlClient" />
</connectionStrings>
```

### API Configuration
```xml
<appSettings>
    <add key="KendrixApi.BaseUrl" value="https://client.kendrix.org/api" />
    <add key="KendrixApi.JwtSecret" value="kendrixServiceSecret123ADWAWDAWwda213123!@3" />
    <add key="KendrixApi.TenantKey" value="KENDRIX-CLIENT-001" />
    <add key="KendrixApi.SyncIntervalMinutes" value="1" />
    <add key="KendrixApi.BatchSize" value="100" />
    <add key="KendrixApi.RetryAttempts" value="3" />
    <add key="KendrixApi.RetryDelaySeconds" value="30" />
    
    <add key="SyncSettings.EnableSync" value="true" />
    <add key="SyncSettings.EnableLogging" value="true" />
    <add key="SyncSettings.LogLevel" value="Information" />
</appSettings>
```

## Installation

### Prerequisites

- .NET Framework 4.7.2 or later
- SQL Server with the required database
- Administrator privileges for service installation

### Build and Install

1. **Build the project**:
   ```bash
   msbuild kendrix-sync-service.csproj /p:Configuration=Release
   ```

2. **Install the service** (Run as Administrator):
   ```powershell
   .\InstallService.ps1
   ```

3. **Start the service**:
   ```powershell
   Start-Service -Name "KendrixSyncService"
   ```

### Manual Installation

1. Build the project in Release mode
2. Copy the executable to a permanent location
3. Install using `sc.exe`:
   ```cmd
   sc.exe create "KendrixSyncService" binPath="C:\Path\To\kendrix-sync-service.exe" start=auto
   sc.exe description "KendrixSyncService" "Windows Service for syncing data with Kendrix API"
   ```

## Usage

### Starting the Service
```powershell
Start-Service -Name "KendrixSyncService"
```

### Stopping the Service
```powershell
Stop-Service -Name "KendrixSyncService"
```

### Checking Service Status
```powershell
Get-Service -Name "KendrixSyncService"
```

### Viewing Logs
The service logs to the Windows Event Log. View logs using:
- Event Viewer (eventvwr.msc)
- PowerShell: `Get-EventLog -LogName Application -Source "Kendrix Sync Service"`

## Troubleshooting

### Common Issues

1. **Service won't start**:
   - Check the connection string in App.config
   - Verify the JWT secret is configured
   - Check Windows Event Log for error details

2. **Sync failures**:
   - Verify API endpoint is accessible
   - Check tenant key configuration
   - Review batch size settings

3. **Database connection issues**:
   - Verify SQL Server is running
   - Check connection string parameters
   - Ensure database exists and is accessible

### Logs

The service logs all activities to the Windows Event Log under the source "Kendrix Sync Service". Check the Application log for detailed information about sync operations and errors.

## Development

### Project Structure

```
kendrix-sync-service/
├── Models/                 # Data models for all tables
├── Services/              # Business logic services
│   ├── JwtService.cs      # JWT token generation
│   ├── DatabaseService.cs # SQL Server operations
│   ├── ApiService.cs      # Kendrix API communication
│   └── SyncService.cs     # Main sync orchestration
├── Service1.cs            # Windows Service implementation
├── Program.cs             # Service entry point
├── App.config             # Configuration
└── InstallService.ps1     # Installation script
```

### Dependencies

- Newtonsoft.Json (13.0.3)
- System.IdentityModel.Tokens.Jwt (6.25.1)
- Microsoft.IdentityModel.Tokens (6.25.1)

## License

Copyright © Kendrix 2025

