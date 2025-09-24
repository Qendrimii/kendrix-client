import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/env.dart';
import '../../features/auth/models/login_request.dart';
import '../../features/auth/models/login_response.dart';
import '../../features/auth/models/user.dart';
import '../networking/dio_client.dart';
import 'jwt_decoder.dart';
import 'token_storage.dart';

class AuthRepository {
  final Dio _dio;
  final TokenStorage _tokenStorage;

  AuthRepository(this._dio, this._tokenStorage);

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '${Env.mobileApiPath}/auth/login',
        data: request.toJson(),
      );

      if (response.data == null) {
        throw Exception('Invalid response from server');
      }

      final loginResponse = LoginResponse.fromJson(response.data!);
      
      print('🔐 Login successful! Token: ${loginResponse.token.substring(0, 20)}...');
      
      // Save tokens
      await _tokenStorage.saveTokens(
        accessToken: loginResponse.token,
        refreshToken: loginResponse.token, // For simplicity, using same token
      );
      
      // Verify tokens were saved
      final savedToken = await _tokenStorage.getAccessToken();
      print('🔐 Token saved successfully: ${savedToken != null}');
      if (savedToken != null) {
        print('🔐 Saved token starts with: ${savedToken.substring(0, 20)}...');
      }

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
      final accessToken = await _tokenStorage.getAccessToken();
      if (accessToken == null) {
        return false;
      }

      final response = await _dio.post<Map<String, dynamic>>(
        '${Env.mobileApiPath}/auth/refresh',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );

      if (response.data == null) {
        return false;
      }

      final newToken = response.data!['token'] as String?;

      if (newToken != null) {
        await _tokenStorage.saveTokens(
          accessToken: newToken,
          refreshToken: newToken, // For simplicity, using same token
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
      final response = await _dio.get<Map<String, dynamic>>(
        '${Env.mobileApiPath}/auth/profile',
      );

      if (response.data == null) {
        throw Exception('Invalid response from server');
      }

      return User.fromJson(response.data!['user']);
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
      await _dio.post('${Env.mobileApiPath}/auth/logout');
    } catch (e) {
      // Ignore errors on logout endpoint
    } finally {
      // Always clear local storage
      await _tokenStorage.clearAll();
    }
  }

  Future<bool> isAuthenticated() async {
    print('🔐 Checking authentication status...');
    final accessToken = await _tokenStorage.getAccessToken();
    print('🔐 Access token exists: ${accessToken != null}');
    
    if (accessToken == null) {
      print('🔐 No access token found');
      return false;
    }

    // Check if token is expired
    final isExpired = JwtDecoder.isExpired(accessToken);
    print('🔐 Token expired: $isExpired');
    
    if (isExpired) {
      print('🔐 Token expired, attempting refresh...');
      // Try to refresh
      final refreshed = await refreshToken();
      print('🔐 Token refresh result: $refreshed');
      return refreshed;
    }

    print('🔐 Authentication check passed');
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
  final dio = ref.watch(dioClientProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  return AuthRepository(dio, tokenStorage);
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