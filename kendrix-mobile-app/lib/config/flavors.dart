enum Flavor {
  development('development'),
  staging('staging'),
  production('production');

  const Flavor(this.value);

  final String value;

  static Flavor get current {
    const env = String.fromEnvironment('APP_ENV', defaultValue: 'development');
    return Flavor.values.firstWhere(
      (flavor) => flavor.value == env,
      orElse: () => Flavor.development,
    );
  }

  bool get isDevelopment => this == Flavor.development;
  bool get isStaging => this == Flavor.staging;
  bool get isProduction => this == Flavor.production;

  String get displayName {
    switch (this) {
      case Flavor.development:
        return 'Development';
      case Flavor.staging:
        return 'Staging';
      case Flavor.production:
        return 'Production';
    }
  }

  String get appName {
    switch (this) {
      case Flavor.development:
        return 'Kendrix (Dev)';
      case Flavor.staging:
        return 'Kendrix (Staging)';
      case Flavor.production:
        return 'Kendrix';
    }
  }
}