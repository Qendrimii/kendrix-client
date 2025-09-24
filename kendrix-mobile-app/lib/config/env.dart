class Env {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://client.kendrix.org',
  );

  static const String appEnv = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'development',
  );

  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Kendrix',
  );

  static const bool isProduction = appEnv == 'production';
  static const bool isDevelopment = appEnv == 'development';
  static const bool isStaging = appEnv == 'staging';

  // API Paths
  static const String mobileApiPath = '/api/mobile/v1';
  static const String syncApiPath = '/api/sync/v1';

  // Demo credentials for testing
  static const String demoTenantKey = 'demo-company-2025';
  static const String demoEmail = 'admin@kendrix.demo';
  static const String demoPassword = 'admin123';

  // JWT
  static const Duration tokenRefreshThreshold = Duration(minutes: 5);
  static const Duration tokenValidationInterval = Duration(minutes: 1);

  // Cache
  static const Duration defaultCacheTtl = Duration(seconds: 60);
  static const Duration longCacheTtl = Duration(minutes: 10);

  // Networking
  static const Duration connectTimeout = Duration(seconds: 8);
  static const Duration receiveTimeout = Duration(seconds: 20);
  static const Duration sendTimeout = Duration(seconds: 20);

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // UI
  static const Duration debounceDelay = Duration(milliseconds: 300);
  static const Duration animationDuration = Duration(milliseconds: 200);
}