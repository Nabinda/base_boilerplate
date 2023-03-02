import 'dart:io';

import 'package:base_boilerplate/config/api_config.dart';
import 'package:base_boilerplate/exceptions/network_exception/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseClient {
  BaseClient._() {
    _setupInterceptor();
  }

  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    headers: {'accept': 'application/json'},
    validateStatus: (_) => true,
    receiveTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(seconds: 20),
    connectTimeout: const Duration(seconds: 20),
  ));

  _setupInterceptor() {
    _dio.interceptors.addAll([
      //To display log files in console
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true)
    ]);
  }

  ///Perform get request to api
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return res.data;
    } on DioError catch (e) {
      throw e.toNetworkException();
    } on SocketException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  ///Perform post request to api
  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return res.data;
    } on DioError catch (e) {
      throw e.toNetworkException();
    } on SocketException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  ///Perform put operation
  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data;
    } on DioError catch (e) {
      throw e.toNetworkException();
    } on SocketException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  ///Perform delete operation in api
  Future<dynamic> delete(String uri) async {
    try {
      final response = await _dio.delete(uri);
      return response.data;
    } on DioError catch (e) {
      throw e.toNetworkException();
    } on SocketException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
