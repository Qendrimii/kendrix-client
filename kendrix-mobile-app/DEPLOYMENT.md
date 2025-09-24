# 🚀 Flutter Web Deployment Guide

## Production Deployment to client.kendrix.org

### 1. Build the Production Version
```bash
flutter build web --release --dart-define=API_BASE_URL=https://client.kendrix.org --dart-define=APP_ENV=production
```

### 2. Deploy Files to Server

#### Upload the following files to the ROOT directory of client.kendrix.org:
- All files from `build/web/` directory:
  - `index.html`
  - `main.dart.js`
  - `flutter.js`
  - `flutter_bootstrap.js`
  - `flutter_service_worker.js`
  - `manifest.json`
  - `favicon.png`
  - `version.json`
  - `assets/` folder (entire folder)
  - `canvaskit/` folder (entire folder)
  - `icons/` folder (entire folder)

#### Upload the .htaccess file:
- Copy `.htaccess-production` to the root directory as `.htaccess`

### 3. Directory Structure After Deployment
```
client.kendrix.org/
├── index.html                    # Flutter web app entry point
├── main.dart.js                  # Flutter app code
├── flutter.js                    # Flutter framework
├── flutter_bootstrap.js          # Flutter bootstrap
├── flutter_service_worker.js     # Service worker
├── manifest.json                 # Web app manifest
├── favicon.png                   # App icon
├── version.json                  # Version info
├── .htaccess                     # URL rewriting rules
├── assets/                       # Flutter assets
├── canvaskit/                    # Flutter rendering engine
├── icons/                        # App icons
└── api/                          # Existing PHP API (keep as is)
    ├── index.php
    ├── classes/
    ├── config/
    └── ...
```

### 4. URL Structure After Deployment
- **Flutter App (root)**: `https://client.kendrix.org/`
- **Login Page**: `https://client.kendrix.org/login`
- **Dashboard**: `https://client.kendrix.org/dashboard`
- **API Endpoints**: `https://client.kendrix.org/api/*`

### 5. Testing the Deployment
1. Visit `https://client.kendrix.org/` - should show Flutter app
2. Navigate to `https://client.kendrix.org/login` - should show login page
3. Login with: `admin@kendrix.demo` / `admin123`
4. Should redirect to `https://client.kendrix.org/dashboard`
5. Test API: `https://client.kendrix.org/api/sync/v1/heartbeat`

### 6. Troubleshooting

#### If routes return 404:
- Verify `.htaccess` file is in the root directory
- Check if mod_rewrite is enabled on the server
- Ensure the rewrite rules are correct

#### If API calls fail:
- Check CORS headers in browser network tab
- Verify API endpoints are working: `/api/sync/v1/heartbeat`
- Check API error logs

#### If Flutter app doesn't load:
- Verify all files were uploaded correctly
- Check browser console for JavaScript errors
- Ensure `index.html` is in the root directory

### 7. Production URLs
- **Demo Credentials**: admin@kendrix.demo / admin123
- **Tenant Key**: demo-company-2025
- **App URL**: https://client.kendrix.org
- **API Base**: https://client.kendrix.org/api