import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isAuthenticated,
    @Default(null) String? userEmail,
    @Default([]) List<String> userRoles,
    @Default([]) List<Map<String, dynamic>> userTenants,
    @Default(null) String? currentTenantKey,
    @Default(null) String? accessToken,
    @Default(null) String? refreshToken,
  }) = _AuthState;
}

// AuthStateNotifier is defined in auth_repository.dart
