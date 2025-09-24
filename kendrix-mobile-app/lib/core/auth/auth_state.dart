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

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(const AuthState());

  void updateAuthState({
    bool? isAuthenticated,
    String? userEmail,
    List<String>? userRoles,
    List<Map<String, dynamic>>? userTenants,
    String? currentTenantKey,
    String? accessToken,
    String? refreshToken,
  }) {
    state = state.copyWith(
      isAuthenticated: isAuthenticated ?? state.isAuthenticated,
      userEmail: userEmail ?? state.userEmail,
      userRoles: userRoles ?? state.userRoles,
      userTenants: userTenants ?? state.userTenants,
      currentTenantKey: currentTenantKey ?? state.currentTenantKey,
      accessToken: accessToken ?? state.accessToken,
      refreshToken: refreshToken ?? state.refreshToken,
    );
  }

  void logout() {
    state = const AuthState();
  }
}
