# Kendrix Mobile App

A production-grade Flutter application for Kendrix point-of-sale management system with role-based access control, JWT authentication, and comprehensive business data views.

## Features

- **Authentication & Authorization**
  - JWT-based authentication with automatic token refresh
  - Role-based access control (Admin, User)
  - Multi-tenant support with tenant switching
  - Secure token storage using flutter_secure_storage

- **Modern UI/UX**
  - Material 3 design system
  - Responsive layout (mobile, tablet, desktop)
  - Light/dark theme support
  - Internationalization (English/Albanian)
  - Shimmer loading states
  - Pull-to-refresh functionality

- **Business Data Management**
  - Dashboard with KPIs and charts
  - Invoice management (Fatura)
  - Purchase management (Blerjet)
  - Stock management (Stoku)
  - Product catalog (ArtikulliBaze)
  - Customer/Supplier management (Subjektet)
  - Reports and analytics

- **Admin Features**
  - Tenant management
  - User management
  - Role assignment
  - User-tenant linking

- **Technical Features**
  - State management with Riverpod
  - Networking with Dio and interceptors
  - Code generation with Freezed and json_serializable
  - Caching with Hive
  - Testing setup (unit, widget, golden tests)

## Getting Started

### Prerequisites

- Flutter 3.13.0 or higher
- Dart 3.1.0 or higher
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd kendrix-mobile-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Generate localization**
   ```bash
   flutter gen-l10n
   ```

### Configuration

Create environment configuration files:

1. **Create .env files for different environments:**

   **.env.development**
   ```
   API_BASE_URL=http://localhost/kendrix-sync-api
   APP_ENV=development
   APP_NAME=Kendrix (Dev)
   ```

   **.env.staging**
   ```
   API_BASE_URL=https://staging-api.kendrix.com
   APP_ENV=staging
   APP_NAME=Kendrix (Staging)
   ```

   **.env.production**
   ```
   API_BASE_URL=https://api.kendrix.com
   APP_ENV=production
   APP_NAME=Kendrix
   ```

2. **Configure API base URL**
   The app reads the API base URL from environment variables. You can override it at runtime:
   ```bash
   flutter run --dart-define=API_BASE_URL=http://your-api-url.com
   ```

### Running the App

#### Development
```bash
# Using development flavor
flutter run -t lib/main_dev.dart --dart-define=API_BASE_URL=http://localhost/kendrix-sync-api

# Or with environment variables
flutter run -t lib/main_dev.dart --dart-define-from-file=.env.development
```

#### Staging
```bash
flutter run -t lib/main_staging.dart --dart-define-from-file=.env.staging
```

#### Production
```bash
flutter run -t lib/main_prod.dart --dart-define-from-file=.env.production --release
```

### Building

#### Android APK
```bash
flutter build apk -t lib/main_prod.dart --dart-define-from-file=.env.production
```

#### Web
```bash
flutter build web -t lib/main_prod.dart --dart-define-from-file=.env.production
```

## Development

### Code Generation

The app uses code generation for models, routing, and localization. Run this command after making changes to:
- Freezed models
- JSON serialization
- Hive adapters

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Adding New Models

1. Create a new model file in the appropriate feature folder
2. Use Freezed and json_serializable annotations
3. Run code generation
4. Export the model in the feature's models barrel file

Example:
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_model.freezed.dart';
part 'my_model.g.dart';

@freezed
class MyModel with _$MyModel {
  const factory MyModel({
    required int id,
    required String name,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _MyModel;

  factory MyModel.fromJson(Map<String, dynamic> json) =>
      _$MyModelFromJson(json);
}
```

### Adding New Screens

1. Create the screen in the appropriate feature folder
2. Add the route to `app_router.dart`
3. Update navigation in `app_scaffold.dart` or `app_drawer.dart`
4. Add any required guards to `route_guards.dart`

### Internationalization

1. Add new strings to `lib/l10n/app_en.arb` and `lib/l10n/app_sq.arb`
2. Run `flutter gen-l10n` to generate the code
3. Use strings in your widgets with `context.l10n.stringKey`

### State Management

The app uses Riverpod for state management. Follow these patterns:

- **Providers**: For dependency injection and simple state
- **StateNotifier**: For complex state management
- **FutureProvider**: For async data fetching
- **StreamProvider**: For real-time data

### API Integration

1. Define models with Freezed and json_serializable
2. Create repository classes for API calls
3. Use Riverpod providers to expose repositories
4. Handle loading states and errors in UI

## Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/unit/auth_test.dart

# Run tests with coverage
flutter test --coverage
```

### Test Types

- **Unit Tests**: Test individual functions and classes
- **Widget Tests**: Test widget behavior and UI
- **Golden Tests**: Test widget visual output
- **Integration Tests**: Test complete user flows

### Writing Tests

Example unit test:
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:kendrix_mobile_app/core/utils/money_formatter.dart';

void main() {
  group('MoneyFormatter', () {
    test('formats money correctly', () {
      expect(MoneyFormatter.format(1234.56), equals('€1,234.56'));
    });
  });
}
```

## Project Structure

```
lib/
├── app.dart                          # Main app widget
├── main_dev.dart                     # Development entry point
├── main_staging.dart                 # Staging entry point
├── main_prod.dart                    # Production entry point
├── config/                           # Configuration
│   ├── env.dart                      # Environment variables
│   └── flavors.dart                  # App flavors
├── core/                             # Core functionality
│   ├── auth/                         # Authentication
│   ├── networking/                   # HTTP client & interceptors
│   ├── routing/                      # Navigation & guards
│   ├── theme/                        # App theming
│   ├── i18n/                        # Internationalization
│   └── utils/                        # Utility functions
├── features/                         # Feature modules
│   ├── auth/                         # Authentication feature
│   ├── dashboard/                    # Dashboard feature
│   ├── admin/                        # Admin features
│   ├── common_lists/                 # Business data lists
│   └── tenant_switcher/              # Tenant selection
├── widgets/                          # Shared widgets
└── l10n/                            # Localization files
```

## API Integration

The app connects to a Laravel API with the following endpoints:

### Authentication
- `POST /auth/login` - User login
- `POST /auth/refresh` - Token refresh
- `POST /auth/logout` - User logout
- `GET /me` - Get current user

### Admin
- `GET|POST|PUT|DELETE /admin/tenants` - Tenant management
- `GET|POST|PUT|DELETE /admin/users` - User management
- `POST|DELETE /admin/user-tenants` - User-tenant linking
- `GET /admin/roles` - Role management
- `POST|DELETE /admin/user-roles` - User-role assignment

### Business Data
- `GET /stats/overview` - Dashboard statistics
- `GET /{entity}` - List entities (with pagination, filtering, sorting)
- `GET /{entity}/{id}` - Get entity details

All API calls include:
- JWT token in Authorization header
- X-Tenant-Id header for tenant-specific data
- Automatic token refresh on 401 errors
- Request/response logging in development

## Performance Optimizations

- **Lazy loading**: Routes and heavy widgets are loaded on demand
- **Caching**: API responses cached with Hive for offline support
- **Pagination**: Large lists use server-side pagination
- **Debouncing**: Search inputs debounced to reduce API calls
- **Shimmer loading**: Beautiful loading states while fetching data
- **Code splitting**: Features organized in separate modules

## Security

- **Secure storage**: Tokens stored in encrypted storage
- **Token refresh**: Automatic token refresh before expiration
- **Input validation**: All user inputs validated
- **Role-based access**: Routes protected by user roles
- **No sensitive logging**: No tokens or PII in production logs

## Deployment

### CI/CD with GitHub Actions

Create `.github/workflows/flutter.yml`:

```yaml
name: Flutter CI

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.13.0'
      - run: flutter pub get
      - run: flutter pub run build_runner build --delete-conflicting-outputs
      - run: flutter analyze
      - run: flutter test

  build-android:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.13.0'
      - run: flutter pub get
      - run: flutter pub run build_runner build --delete-conflicting-outputs
      - run: flutter build apk -t lib/main_prod.dart --dart-define=API_BASE_URL=${{ secrets.API_BASE_URL }}

  build-web:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.13.0'
      - run: flutter pub get
      - run: flutter pub run build_runner build --delete-conflicting-outputs
      - run: flutter build web -t lib/main_prod.dart --dart-define=API_BASE_URL=${{ secrets.API_BASE_URL }}
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style

- Follow the official [Dart style guide](https://dart.dev/guides/language/effective-dart)
- Use the provided `analysis_options.yaml` configuration
- Run `flutter analyze` before committing
- Use meaningful commit messages

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, email support@kendrix.com or create an issue in the repository.