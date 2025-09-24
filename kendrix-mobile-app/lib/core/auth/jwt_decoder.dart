import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class JwtDecoder {
  static Map<String, dynamic>? decodePayload(String token) {
    try {
      final jwt = JWT.decode(token);
      return jwt.payload as Map<String, dynamic>?;
    } catch (e) {
      return null;
    }
  }

  static bool isExpired(String token) {
    try {
      final payload = decodePayload(token);
      if (payload == null) return true;

      final exp = payload['exp'] as int?;
      if (exp == null) return true;

      final expirationDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      return DateTime.now().isAfter(expirationDate);
    } catch (e) {
      return true;
    }
  }

  static bool isExpiringSoon(String token, {Duration threshold = const Duration(minutes: 5)}) {
    try {
      final payload = decodePayload(token);
      if (payload == null) return true;

      final exp = payload['exp'] as int?;
      if (exp == null) return true;

      final expirationDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      final thresholdDate = DateTime.now().add(threshold);
      
      return thresholdDate.isAfter(expirationDate);
    } catch (e) {
      return true;
    }
  }

  static DateTime? getExpirationDate(String token) {
    try {
      final payload = decodePayload(token);
      if (payload == null) return null;

      final exp = payload['exp'] as int?;
      if (exp == null) return null;

      return DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    } catch (e) {
      return null;
    }
  }

  static String? getUserId(String token) {
    try {
      final payload = decodePayload(token);
      return payload?['sub'] as String?;
    } catch (e) {
      return null;
    }
  }

  static List<String> getRoles(String token) {
    try {
      final payload = decodePayload(token);
      final roles = payload?['roles'] as List<dynamic>?;
      return roles?.map((role) => role.toString()).toList() ?? [];
    } catch (e) {
      return [];
    }
  }

  static List<Map<String, dynamic>> getTenants(String token) {
    try {
      final payload = decodePayload(token);
      final tenants = payload?['tenants'] as List<dynamic>?;
      return tenants?.map((tenant) => tenant as Map<String, dynamic>).toList() ?? [];
    } catch (e) {
      return [];
    }
  }
}