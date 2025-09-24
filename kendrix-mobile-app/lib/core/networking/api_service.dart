import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/auth_state.dart';
import '../auth/token_storage.dart';

class ApiService {
  static const String _baseUrl = 'https://client.kendrix.org';
  static const String _apiPrefix = '/api/mobile/v1';
  
  static ApiService? _instance;
  static ApiService get instance => _instance ??= ApiService._();
  
  final TokenStorage _tokenStorage = TokenStorage();
  
  ApiService._();

  Future<Map<String, String>> _getHeaders() async {
    final token = await _tokenStorage.getAccessToken();
    
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    
    return headers;
  }

  Future<String?> _getTenantKey() async {
    final tenantKey = await _tokenStorage.getTenantKey();
    print('🔐 Retrieved tenant key: $tenantKey');
    return tenantKey;
  }

  Future<ApiResponse<T>> _makeRequest<T>(
    String method,
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final headers = await _getHeaders();
      final tenantKey = await _getTenantKey();
      
      print('🌐 API Request - Tenant Key: $tenantKey');
      print('🌐 API Request - Headers: $headers');
      
      if (tenantKey != null) {
        headers['X-Tenant-External-Key'] = tenantKey;
        print('🌐 API Request - Added X-Tenant-External-Key: $tenantKey');
      } else {
        print('🌐 API Request - No tenant key found!');
      }

      final uri = Uri.parse('$_baseUrl$_apiPrefix$endpoint');
      final uriWithParams = queryParams != null 
          ? uri.replace(queryParameters: queryParams.map((k, v) => MapEntry(k, v.toString())))
          : uri;

      print('🌐 Making HTTP request to: $uriWithParams');
      print('🌐 Request method: $method');
      
      http.Response response;
      
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(uriWithParams, headers: headers);
          break;
        case 'POST':
          response = await http.post(
            uriWithParams,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        case 'PUT':
          response = await http.put(
            uriWithParams,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        case 'DELETE':
          response = await http.delete(uriWithParams, headers: headers);
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      print('🌐 HTTP response status: ${response.statusCode}');
      print('🌐 HTTP response body: ${response.body}');

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (fromJson != null && responseData['data'] != null) {
          return ApiResponse<T>.success(
            fromJson(responseData['data']),
            response.statusCode,
          );
        } else {
          return ApiResponse<T>.success(
            responseData as T,
            response.statusCode,
          );
        }
      } else {
        return ApiResponse<T>.error(
          responseData['error'] ?? 'Unknown error',
          response.statusCode,
          responseData['details'],
        );
      }
    } catch (e) {
      return ApiResponse<T>.error(
        'Network error: $e',
        0,
        e.toString(),
      );
    }
  }

  // Authentication endpoints
  Future<ApiResponse<LoginResponse>> login(String email, String password, String tenantKey) async {
    return _makeRequest<LoginResponse>(
      'POST',
      '/auth/login',
      body: {
        'email': email,
        'password': password,
        'tenant_key': tenantKey,
      },
      fromJson: (data) => LoginResponse.fromJson(data),
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> refreshToken() async {
    return _makeRequest<Map<String, dynamic>>('POST', '/auth/refresh');
  }

  Future<ApiResponse<Map<String, dynamic>>> getProfile() async {
    return _makeRequest<Map<String, dynamic>>('GET', '/auth/profile');
  }

  Future<ApiResponse<Map<String, dynamic>>> logout() async {
    return _makeRequest<Map<String, dynamic>>('POST', '/auth/logout');
  }

  // Dashboard endpoints
  Future<ApiResponse<DashboardStats>> getDashboardStats() async {
    print('🌐 getDashboardStats called');
    return _makeRequest<DashboardStats>(
      'GET',
      '/dashboard/stats',
      fromJson: (data) => DashboardStats.fromJson(data),
    );
  }

  // Entity endpoints
  Future<ApiResponse<PaginatedResponse<T>>> getEntities<T>(
    String table, {
    int page = 1,
    int limit = 50,
    String? search,
    Map<String, dynamic>? filters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    print('🌐 getEntities called for table: $table');
    final queryParams = <String, String>{
      'table': table,
      'page': page.toString(),
      'limit': limit.toString(),
    };
    
    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }
    
    if (filters != null) {
      filters.forEach((key, value) {
        if (value != null) {
          queryParams[key] = value.toString();
        }
      });
    }

    return _makeRequest<PaginatedResponse<T>>(
      'GET',
      '/entities',
      queryParams: queryParams,
      fromJson: (data) => PaginatedResponse<T>.fromJson(data, fromJson),
    );
  }

  Future<ApiResponse<T>> getEntity<T>(
    String table,
    int id, {
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    return _makeRequest<T>(
      'GET',
      '/entities/single',
      queryParams: {
        'table': table,
        'id': id.toString(),
      },
      fromJson: fromJson,
    );
  }

  Future<ApiResponse<T>> createEntity<T>(
    String table,
    Map<String, dynamic> data, {
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    return _makeRequest<T>(
      'POST',
      '/entities',
      body: {
        'table': table,
        'data': data,
      },
      fromJson: fromJson,
    );
  }

  Future<ApiResponse<T>> updateEntity<T>(
    String table,
    int id,
    Map<String, dynamic> data, {
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    return _makeRequest<T>(
      'PUT',
      '/entities',
      body: {
        'table': table,
        'id': id,
        'data': data,
      },
      fromJson: fromJson,
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> deleteEntity(String table, int id) async {
    return _makeRequest<Map<String, dynamic>>(
      'DELETE',
      '/entities',
      body: {
        'table': table,
        'id': id,
      },
    );
  }
}

class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? error;
  final int statusCode;
  final String? details;

  ApiResponse._({
    required this.success,
    this.data,
    this.error,
    required this.statusCode,
    this.details,
  });

  factory ApiResponse.success(T data, int statusCode) {
    return ApiResponse._(
      success: true,
      data: data,
      statusCode: statusCode,
    );
  }

  factory ApiResponse.error(String error, int statusCode, [String? details]) {
    return ApiResponse._(
      success: false,
      error: error,
      statusCode: statusCode,
      details: details,
    );
  }
}

class PaginatedResponse<T> {
  final List<T> data;
  final PaginationInfo pagination;

  PaginatedResponse({
    required this.data,
    required this.pagination,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJson,
  ) {
    print('🌐 PaginatedResponse.fromJson called with: $json');
    
    // The API response has nested data structure: { "data": { "data": [...], "pagination": {...} } }
    final dataList = (json['data'] as List)
        .map((item) => fromJson != null ? fromJson(item) : item as T)
        .toList();

    print('🌐 Parsed data list length: ${dataList.length}');

    return PaginatedResponse<T>(
      data: dataList,
      pagination: PaginationInfo.fromJson(json['pagination']),
    );
  }
}

class PaginationInfo {
  final int page;
  final int limit;
  final int total;
  final int totalPages;

  PaginationInfo({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
  });

  factory PaginationInfo.fromJson(Map<String, dynamic> json) {
    return PaginationInfo(
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 50,
      total: json['total'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
    );
  }
}

class LoginResponse {
  final String token;
  final User user;
  final String expiresAt;

  LoginResponse({
    required this.token,
    required this.user,
    required this.expiresAt,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
      expiresAt: json['expiresAt'] ?? '',
    );
  }
}

class User {
  final int id;
  final String email;
  final List<String> roles;
  final List<Tenant> tenants;

  User({
    required this.id,
    required this.email,
    required this.roles,
    required this.tenants,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      roles: List<String>.from(json['roles'] ?? []),
      tenants: (json['tenants'] as List?)
          ?.map((t) => Tenant.fromJson(t))
          .toList() ?? [],
    );
  }
}

class Tenant {
  final int id;
  final String name;
  final String externalKey;

  Tenant({
    required this.id,
    required this.name,
    required this.externalKey,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      id: json['Id'] ?? json['id'] ?? 0,
      name: json['Name'] ?? json['name'] ?? '',
      externalKey: json['ExternalKey'] ?? json['externalKey'] ?? '',
    );
  }
}

class DashboardStats {
  final Map<String, dynamic> today;
  final Map<String, dynamic> monthly;
  final List<Map<String, dynamic>> recentInvoices;
  final List<Map<String, dynamic>> lowStock;

  DashboardStats({
    required this.today,
    required this.monthly,
    required this.recentInvoices,
    required this.lowStock,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) {
    return DashboardStats(
      today: json['today'] ?? {},
      monthly: json['monthly'] ?? {},
      recentInvoices: List<Map<String, dynamic>>.from(json['recentInvoices'] ?? []),
      lowStock: List<Map<String, dynamic>>.from(json['lowStock'] ?? []),
    );
  }
}
