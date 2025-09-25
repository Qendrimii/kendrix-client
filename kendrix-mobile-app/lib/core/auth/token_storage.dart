import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _selectedTenantIdKey = 'selected_tenant_id';
  static const _tenantKeyKey = 'tenant_key';
  static const _rememberedTenantKeyKey = 'remembered_tenant_key';

  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    webOptions: WebOptions(),
  );

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    print('🔐 Saving tokens...');
    
    if (kIsWeb) {
      // Use SharedPreferences for web
      final prefs = await SharedPreferences.getInstance();
      await Future.wait([
        prefs.setString(_accessTokenKey, accessToken),
        prefs.setString(_refreshTokenKey, refreshToken),
      ]);
      print('🔐 Tokens saved to SharedPreferences (web)');
    } else {
      // Use FlutterSecureStorage for mobile
      await Future.wait([
        _storage.write(key: _accessTokenKey, value: accessToken),
        _storage.write(key: _refreshTokenKey, value: refreshToken),
      ]);
      print('🔐 Tokens saved to FlutterSecureStorage (mobile)');
    }
  }

  Future<String?> getAccessToken() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(_accessTokenKey);
      print('🔐 Retrieved access token from SharedPreferences: ${token != null}');
      return token;
    } else {
      final token = await _storage.read(key: _accessTokenKey);
      print('🔐 Retrieved access token from FlutterSecureStorage: ${token != null}');
      return token;
    }
  }

  Future<String?> getRefreshToken() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_refreshTokenKey);
    } else {
      return await _storage.read(key: _refreshTokenKey);
    }
  }

  Future<void> clearTokens() async {
    print('🔐 Clearing tokens...');
    
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await Future.wait([
        prefs.remove(_accessTokenKey),
        prefs.remove(_refreshTokenKey),
      ]);
    } else {
      await Future.wait([
        _storage.delete(key: _accessTokenKey),
        _storage.delete(key: _refreshTokenKey),
      ]);
    }
  }

  Future<void> setSelectedTenantId(int tenantId) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_selectedTenantIdKey, tenantId);
    } else {
      await _storage.write(key: _selectedTenantIdKey, value: tenantId.toString());
    }
  }

  Future<int?> getSelectedTenantId() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_selectedTenantIdKey);
    } else {
      final value = await _storage.read(key: _selectedTenantIdKey);
      return value != null ? int.tryParse(value) : null;
    }
  }

  Future<void> clearSelectedTenant() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_selectedTenantIdKey);
    } else {
      await _storage.delete(key: _selectedTenantIdKey);
    }
  }

  Future<bool> hasValidTokens() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    return accessToken != null && refreshToken != null;
  }

  Future<void> clearAll() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } else {
      await _storage.deleteAll();
    }
  }

  Future<String?> getTenantKey() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_tenantKeyKey);
    } else {
      return await _storage.read(key: _tenantKeyKey);
    }
  }

  Future<void> setTenantKey(String tenantKey) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tenantKeyKey, tenantKey);
    } else {
      await _storage.write(key: _tenantKeyKey, value: tenantKey);
    }
  }

  Future<void> clearTenantKey() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tenantKeyKey);
    } else {
      await _storage.delete(key: _tenantKeyKey);
    }
  }

  // Methods for remembering tenant key for login form convenience
  Future<String?> getRememberedTenantKey() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_rememberedTenantKeyKey);
    } else {
      return await _storage.read(key: _rememberedTenantKeyKey);
    }
  }

  Future<void> setRememberedTenantKey(String tenantKey) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_rememberedTenantKeyKey, tenantKey);
    } else {
      await _storage.write(key: _rememberedTenantKeyKey, value: tenantKey);
    }
  }

  Future<void> clearRememberedTenantKey() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_rememberedTenantKeyKey);
    } else {
      await _storage.delete(key: _rememberedTenantKeyKey);
    }
  }
}

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  return TokenStorage();
});