import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/env.dart';
import '../auth/auth_repository.dart';
import '../auth/token_storage.dart';
import 'dio_client.dart';

class AuthInterceptor extends Interceptor {
  final Ref _ref;

  AuthInterceptor(this._ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final tokenStorage = _ref.read(tokenStorageProvider);
      final accessToken = await tokenStorage.getAccessToken();
      
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }

      // Add tenant ID if available
      final tenantId = await tokenStorage.getSelectedTenantId();
      if (tenantId != null) {
        options.headers['X-Tenant-Id'] = tenantId.toString();
      }
    } catch (e) {
      developer.log('Error in AuthInterceptor onRequest: $e');
    }
    
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final authRepository = _ref.read(authRepositoryProvider);
        final refreshed = await authRepository.refreshToken();
        
        if (refreshed) {
          // Retry the request with new token
          final tokenStorage = _ref.read(tokenStorageProvider);
          final newAccessToken = await tokenStorage.getAccessToken();
          
          if (newAccessToken != null) {
            err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
            
            final dio = _ref.read(dioClientProvider);
            try {
              final response = await dio.fetch(err.requestOptions);
              handler.resolve(response);
              return;
            } catch (retryError) {
              // If retry fails, proceed with original error
            }
          }
        }
        
        // If refresh failed, logout user
        await authRepository.logout();
      } catch (e) {
        developer.log('Error in AuthInterceptor onError: $e');
      }
    }
    
    handler.next(err);
  }
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (Env.isDevelopment) {
      developer.log(
        '🌐 ${options.method} ${options.uri}',
        name: 'HTTP Request',
      );
      if (options.data != null) {
        developer.log(
          'Data: ${options.data}',
          name: 'HTTP Request',
        );
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (Env.isDevelopment) {
      developer.log(
        '✅ ${response.statusCode} ${response.requestOptions.uri}',
        name: 'HTTP Response',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (Env.isDevelopment) {
      developer.log(
        '❌ ${err.response?.statusCode} ${err.requestOptions.uri}',
        name: 'HTTP Error',
      );
      developer.log(
        'Error: ${err.message}',
        name: 'HTTP Error',
      );
    }
    handler.next(err);
  }
}

class RetryInterceptor extends Interceptor {
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 1);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;
    
    // Don't retry for certain status codes
    if (err.response?.statusCode != null) {
      final statusCode = err.response!.statusCode!;
      if (statusCode >= 400 && statusCode < 500) {
        // Client errors should not be retried (except 401 which is handled by AuthInterceptor)
        handler.next(err);
        return;
      }
    }

    // Don't retry if it's not a connection error
    if (err.type != DioExceptionType.connectionTimeout &&
        err.type != DioExceptionType.receiveTimeout &&
        err.type != DioExceptionType.sendTimeout &&
        err.type != DioExceptionType.connectionError) {
      handler.next(err);
      return;
    }

    final retryCount = requestOptions.extra['retryCount'] ?? 0;
    
    if (retryCount < maxRetries) {
      requestOptions.extra['retryCount'] = retryCount + 1;
      
      await Future.delayed(retryDelay * (retryCount + 1));
      
      try {
        final dio = Dio();
        dio.options.baseUrl = requestOptions.baseUrl;
        dio.options.connectTimeout = requestOptions.connectTimeout;
        dio.options.receiveTimeout = requestOptions.receiveTimeout;
        dio.options.headers = requestOptions.headers;
        final response = await dio.fetch(requestOptions);
        handler.resolve(response);
        return;
      } catch (retryError) {
        if (retryError is DioException) {
          err = retryError;
        }
      }
    }
    
    handler.next(err);
  }
}