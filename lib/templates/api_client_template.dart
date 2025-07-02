String apiClientTemplate() => '''
import 'dart:io';

import 'package:{{projectName}}/core/datasources/local/user_token.dart';
import 'package:{{projectName}}/core/entities/api_entity.dart';
import 'package:{{projectName}}/core/models/api_response.dart';
import 'package:{{projectName}}/core/utils/constants/api_endpoints.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  ApiClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await UserToken().getToken();
          options.headers["Authorization"] = "Bearer \$token";
          return handler.next(options);
        },
      ),
    );
  }

  Future<ApiEntity<T>> get<T>(
      String path, {
        Map<String, dynamic>? query,
        T Function(Map<String, dynamic> json)? fromJson,
      }) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      return ApiResponse<T>.fromJson(response.data, fromJson: fromJson);
    } on DioException catch (e) {
      return ApiResponse<T>.error(
        e.response?.data?['message'] ?? e.message ?? "An error occurred",
      );
    } on SocketException catch (_) {
      return ApiResponse<T>.error("Please check your network");
    } catch (e) {
      return ApiResponse<T>.error(e.toString());
    }
  }

  Future<ApiEntity<T>> post<T>(
      String path, {
        dynamic bodyData,
        Map<String, dynamic>? query,
        T Function(Map<String, dynamic> json)? fromJson,
      }) async {
    try {
      final response =
      await _dio.post(path, data: bodyData, queryParameters: query);

      return ApiResponse<T>.fromJson(response.data, fromJson: fromJson);
    } on DioException catch (e) {
      return ApiResponse<T>.error(
        e.response?.data?['message'] ?? e.message ?? "An error occurred",
      );
    } on SocketException catch (_) {
      return ApiResponse<T>.error("Please check your network");
    } catch (e) {
      return ApiResponse<T>.error(e.toString());
    }
  }

  Future<ApiEntity<T>> put<T>(
      String path, {
        dynamic bodyData,
        Map<String, dynamic>? query,
        T Function(Map<String, dynamic> json)? fromJson,
      }) async {
    try {
      final response =
      await _dio.put(path, data: bodyData, queryParameters: query);
      return ApiResponse<T>.fromJson(response.data, fromJson: fromJson);
    } on DioException catch (e) {
      return ApiResponse<T>.error(
        e.response?.data?['message'] ?? e.message ?? "An error occurred",
      );
    } on SocketException catch (_) {
      return ApiResponse<T>.error("Please check your network");
    } catch (e) {
      return ApiResponse<T>.error(e.toString());
    }
  }

  Future<ApiEntity<T>> patch<T>(
      String path, {
        dynamic bodyData,
        Map<String, dynamic>? query,
        T Function(Map<String, dynamic> json)? fromJson,
      }) async {
    try {
      final response =
      await _dio.patch(path, data: bodyData, queryParameters: query);
      return ApiResponse<T>.fromJson(response.data, fromJson: fromJson);
    } on DioException catch (e) {
      return ApiResponse<T>.error(
        e.response?.data?['message'] ?? e.message ?? "An error occurred",
      );
    } on SocketException catch (_) {
      return ApiResponse<T>.error("Please check your network");
    } catch (e) {
      return ApiResponse<T>.error(e.toString());
    }
  }

  Future<ApiEntity<T>> delete<T>(
      String path, {
        dynamic bodyData,
        Map<String, dynamic>? query,
        T Function(Map<String, dynamic> json)? fromJson,
      }) async {
    try {
      final response =
      await _dio.delete(path, data: bodyData, queryParameters: query);
      return ApiResponse<T>.fromJson(response.data, fromJson: fromJson);
    } on DioException catch (e) {
      return ApiResponse<T>.error(
        e.response?.data?['message'] ?? e.message ?? "An error occurred",
      );
    } on SocketException catch (_) {
      return ApiResponse<T>.error("Please check your network");
    } catch (e) {
      return ApiResponse<T>.error(e.toString());
    }
  }

  Future<ApiEntity<T>> options<T>(
      String path, {
        Map<String, dynamic>? query,
        T Function(Map<String, dynamic> json)? fromJson,
      }) async {
    try {
      final response = await _dio.options(path, queryParameters: query);
      return ApiResponse<T>.fromJson(response.data, fromJson: fromJson);
    } on DioException catch (e) {
      return ApiResponse<T>.error(
        e.response?.data?['message'] ?? e.message ?? "An error occurred",
      );
    } on SocketException catch (_) {
      return ApiResponse<T>.error("Please check your network");
    } catch (e) {
      return ApiResponse<T>.error(e.toString());
    }
  }
}
''';
