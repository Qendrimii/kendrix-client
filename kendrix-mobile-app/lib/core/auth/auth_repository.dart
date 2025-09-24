import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/auth/models/login_request.dart';
import '../../features/auth/models/login_response.dart';
import '../../features/auth/models/user.dart';
import '../networking/dio_client.dart';
import 'jwt_decoder.dart';
import 'token_storage.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final TokenStorage _tokenStorage;

  AuthRepository(this._apiClient, this._tokenStorage);

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/auth/login',
        data: request.toJson(),
      );

      if (response.data == null) {
        throw Exception('Invalid response from server');
      }

      final loginResponse = LoginResponse.fromJson(response.data!);
      
      // Save tokens
      await _tokenStorage.saveTokens(
        accessToken: loginResponse.accessToken,
        refreshToken: loginResponse.refreshToken,
      );

      return loginResponse;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Invalid credentials');
      } else if (e.response?.statusCode == 422) {
        throw Exception('Invalid input data');
      } else {
        throw Exception('Login failed: ${e.message}');
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<bool> refreshToken() async {
    try {
      final refreshToken = await _tokenStorage.getRefreshToken();
      if (refreshToken == null) {
        return false;
      }

      final response = await _apiClient.post<Map<String, dynamic>>(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );

      if (response.data == null) {
        return false;
      }

      final accessToken = response.data!['access_token'] as String?;
      final newRefreshToken = response.data!['refresh_token'] as String?;

      if (accessToken != null && newRefreshToken != null) {
        await _tokenStorage.saveTokens(
          accessToken: accessToken,
          refreshToken: newRefreshToken,
        );
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<User> getCurrentUser() async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>('/me');

      if (response.data == null) {
        throw Exception('Invalid response from server');
      }

      return User.fromJson(response.data!);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized');
      } else {
        throw Exception('Failed to get user info: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to get user info: $e');
    }
  }

  Future<void> logout() async {
    try {
      // Try to call logout endpoint
      await _apiClient.post('/auth/logout');
    } catch (e) {
      // Ignore errors on logout endpoint
    } finally {
      // Always clear local storage
      await _tokenStorage.clearAll();
    }
  }

  Future<bool> isAuthenticated() async {
    final accessToken = await _tokenStorage.getAccessToken();
    if (accessToken == null) {
      return false;
    }

    // Check if token is expired
    if (JwtDecoder.isExpired(accessToken)) {
      // Try to refresh
      final refreshed = await refreshToken();
      return refreshed;
    }

    return true;
  }

  Future<List<String>> getUserRoles() async {
    final accessToken = await _tokenStorage.getAccessToken();
    if (accessToken == null) {
      return [];
    }

    return JwtDecoder.getRoles(accessToken);
  }

  Future<List<Map<String, dynamic>>> getUserTenants() async {
    final accessToken = await _tokenStorage.getAccessToken();
    if (accessToken == null) {
      return [];
    }

    return JwtDecoder.getTenants(accessToken);
  }

  Future<bool> hasRole(String role) async {
    final roles = await getUserRoles();
    return roles.contains(role);
  }

  Future<bool> isAdmin() async {
    return await hasRole('admin');
  }

  Future<void> selectTenant(int tenantId) async {
    await _tokenStorage.setSelectedTenantId(tenantId);
  }

  Future<int?> getSelectedTenantId() async {
    return await _tokenStorage.getSelectedTenantId();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  return AuthRepository(apiClient, tokenStorage);
});

// Auth state provider
final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthStateNotifier(authRepository);
});

class AuthState {
  final bool isAuthenticated;
  final User? user;
  final bool isLoading;
  final String? error;
  final List<Map<String, dynamic>> tenants;
  final int? selectedTenantId;

  const AuthState({
    this.isAuthenticated = false,
    this.user,
    this.isLoading = false,
    this.error,
    this.tenants = const [],
    this.selectedTenantId,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    User? user,
    bool? isLoading,
    String? error,
    List<Map<String, dynamic>>? tenants,
    int? selectedTenantId,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      tenants: tenants ?? this.tenants,
      selectedTenantId: selectedTenantId ?? this.selectedTenantId,
    );
  }
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthStateNotifier(this._authRepository) : super(const AuthState()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    state = state.copyWith(isLoading: true);
    
    try {
      final isAuth = await _authRepository.isAuthenticated();
      if (isAuth) {
        final user = await _authRepository.getCurrentUser();
        final tenants = await _authRepository.getUserTenants();
        final selectedTenantId = await _authRepository.getSelectedTenantId();
        
        state = state.copyWith(
          isAuthenticated: true,
          user: user,
          tenants: tenants,
          selectedTenantId: selectedTenantId,
          isLoading: false,
        );
      } else {
        state = state.copyWith(isAuthenticated: false, isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        isAuthenticated: false,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> login(LoginRequest request) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final response = await _authRepository.login(request);
      final tenants = await _authRepository.getUserTenants();
      
      state = state.copyWith(
        isAuthenticated: true,
        user: response.user,
        tenants: tenants,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isAuthenticated: false,
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    state = const AuthState();
  }

  Future<void> selectTenant(int tenantId) async {
    await _authRepository.selectTenant(tenantId);
    state = state.copyWith(selectedTenantId: tenantId);
  }

  Future<void> refreshUser() async {
    try {
      final user = await _authRepository.getCurrentUser();
      state = state.copyWith(user: user);
    } catch (e) {
      // Handle error if needed
    }
  }
}