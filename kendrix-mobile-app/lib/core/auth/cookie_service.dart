import 'dart:html' as html;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class CookieService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tenantKey = 'tenant_key';
  static const String _userKey = 'user_data';
  static const String _tenantsKey = 'tenants_data';
  
  // Cookie expiration time (7 days)
  static const int _cookieExpirationDays = 7;
  
  static bool get isWeb => kIsWeb;
  
  /// Save authentication data to cookies
  static Future<void> saveAuthData({
    required String accessToken,
    required String refreshToken,
    required Map<String, dynamic> user,
    required List<Map<String, dynamic>> tenants,
    String? tenantKey,
  }) async {
    if (!isWeb) return;
    
    final expirationDate = DateTime.now().add(Duration(days: _cookieExpirationDays));
    
    // Save tokens
    _setCookie(_accessTokenKey, accessToken, expirationDate);
    _setCookie(_refreshTokenKey, refreshToken, expirationDate);
    
    // Save user data
    _setCookie(_userKey, jsonEncode(user), expirationDate);
    _setCookie(_tenantsKey, jsonEncode(tenants), expirationDate);
    
    // Save tenant key if provided
    if (tenantKey != null) {
      _setCookie(_tenantKey, tenantKey, expirationDate);
    }
    
    print('🍪 Auth data saved to cookies');
  }
  
  /// Get access token from cookies
  static String? getAccessToken() {
    if (!isWeb) return null;
    return _getCookie(_accessTokenKey);
  }
  
  /// Get refresh token from cookies
  static String? getRefreshToken() {
    if (!isWeb) return null;
    return _getCookie(_refreshTokenKey);
  }
  
  /// Get tenant key from cookies
  static String? getTenantKey() {
    if (!isWeb) return null;
    return _getCookie(_tenantKey);
  }
  
  /// Get user data from cookies
  static Map<String, dynamic>? getUserData() {
    if (!isWeb) return null;
    final userJson = _getCookie(_userKey);
    if (userJson == null) return null;
    
    try {
      return jsonDecode(userJson) as Map<String, dynamic>;
    } catch (e) {
      print('🍪 Error parsing user data from cookie: $e');
      return null;
    }
  }
  
  /// Get tenants data from cookies
  static List<Map<String, dynamic>>? getTenantsData() {
    if (!isWeb) return null;
    final tenantsJson = _getCookie(_tenantsKey);
    if (tenantsJson == null) return null;
    
    try {
      final List<dynamic> tenantsList = jsonDecode(tenantsJson) as List<dynamic>;
      return tenantsList.map((e) => e as Map<String, dynamic>).toList();
    } catch (e) {
      print('🍪 Error parsing tenants data from cookie: $e');
      return null;
    }
  }
  
  /// Check if user is authenticated (has valid cookies)
  static bool isAuthenticated() {
    if (!isWeb) return false;
    return getAccessToken() != null;
  }
  
  /// Clear all authentication cookies
  static void clearAuthData() {
    if (!isWeb) return;
    
    _deleteCookie(_accessTokenKey);
    _deleteCookie(_refreshTokenKey);
    _deleteCookie(_tenantKey);
    _deleteCookie(_userKey);
    _deleteCookie(_tenantsKey);
    
    print('🍪 Auth data cleared from cookies');
  }
  
  /// Set a cookie with expiration
  static void _setCookie(String name, String value, DateTime expiration) {
    final expires = expiration.toUtc().toIso8601String();
    html.document.cookie = '$name=$value; expires=$expires; path=/; SameSite=Lax; Secure';
  }
  
  /// Get a cookie value
  static String? _getCookie(String name) {
    final cookieString = html.document.cookie;
    if (cookieString == null || cookieString.isEmpty) return null;
    
    final cookies = cookieString.split(';');
    for (final cookie in cookies) {
      final parts = cookie.trim().split('=');
      if (parts.length == 2 && parts[0] == name) {
        return parts[1];
      }
    }
    return null;
  }
  
  /// Delete a cookie
  static void _deleteCookie(String name) {
    html.document.cookie = '$name=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
  }
}
