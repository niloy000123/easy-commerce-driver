import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simple_ecommerce_delivery_app/core/error/exceptions.dart';
import 'package:simple_ecommerce_delivery_app/core/utils/request_handler.dart';

class _ApiClient {
  static final _ApiClient _instance = _ApiClient._internal();
  factory _ApiClient() => _instance;
  _ApiClient._internal() {
    addApiInterceptors(_dio);
  }

  final Dio _dio = Dio();

  Map<String, dynamic> defaultHeaders = {HttpHeaders.authorizationHeader: null};

  Future<Response> get(String url, {Map<String, dynamic>? query}) async {
    return _dio.get(
      url,
      queryParameters: query,
      options: Options(headers: defaultHeaders),
    );
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.post(
      url,
      data: data,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: true,
        validateStatus: ((status) {
          return status! < 500;
        }),
      ),
    );
  }

  Future<Response> patch(
    String url, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.patch(
      url,
      data: data,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: true,
        validateStatus: ((status) {
          return status! < 500;
        }),
      ),
    );
  }

  Future<Response> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.put(
      url,
      data: data,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: false,
        validateStatus: ((status) {
          return status! <= 500;
        }),
      ),
    );
  }

  Future<Response> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.delete(
      url,
      data: data,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: false,
        validateStatus: ((status) {
          return status! <= 500;
        }),
      ),
    );
  }

  void updateToken({required String token}) {
    defaultHeaders[HttpHeaders.authorizationHeader] = 'Bearer $token';
  }

  void updateTokenDefault() {
    defaultHeaders[HttpHeaders.authorizationHeader] = null;
  }

  Future dioRequest(Function apiCall, {String? apiEnd}) async {
    try {
      return await apiCall();
    } on ServerException {
      rethrow;
    } on SocketException {
      var error =
          'No internet connection. Please check your network. on api => $apiEnd';
      debugPrint(error);
      throw const ServerException(
        'No internet connection. Please check your network.',
      );
    } on ArgumentError {
      var error = 'Caught an ArgumentError on api => $apiEnd';
      debugPrint(error);
      throw const ServerException('Caught an ArgumentError.');
    } on DioException catch (e) {
      debugPrint('Caught DioException on api => $apiEnd');

      final data = e.response?.data;
      if (data != null) {
        checkError(data);
      }
    } on FormatException {
      var error =
          'Caught a FormatException: Invalid number format on api => $apiEnd';
      debugPrint(error);
      throw const ServerException(
        'Caught a FormatException: Invalid number format.',
      );
    } on TypeError {
      var error = 'Data type error on api => $apiEnd';
      debugPrint(error);
      throw const ServerException('Data type error');
    } on Exception catch (e) {
      var error = 'Caught a general Exception: $e on api => $apiEnd';
      debugPrint(error);
      throw const ServerException('Caught a general Exception');
    } catch (e) {
      var error = 'Unknown error on api: $e on api => $apiEnd';
      debugPrint(error);
      throw const ServerException('Unknown error');
    }
  }

  checkError(dynamic data) {
    String message = 'Something went wrong';

    if (data.containsKey('errors') && data['errors'] is Map) {
      // ✅ Use the first key from the `errors` map
      final errors = data['errors'] as Map;
      final firstKey = errors.keys.first;
      final firstError = errors[firstKey];
      if (firstError is List && firstError.isNotEmpty) {
        message = firstError.first;
      } else {
        message = firstKey.toString(); // Fallback to key
      }
    } else if (data.containsKey('message')) {
      message = data['message'].toString();
    }

    throw ServerException(message);
  }
}

final apiClient = _ApiClient();
