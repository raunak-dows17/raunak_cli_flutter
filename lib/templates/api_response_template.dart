String apiResponseTemplate() => '''
import 'package:{{projectName}}/core/entities/api_entity.dart';

class ApiResponse<T> extends ApiEntity<T> {
  ApiResponse({required super.status, required super.message, super.data});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, {
        T Function(Map<String, dynamic>)? fromJson,
      }) {
    return ApiResponse<T>(
      status: json["status"] ?? false,
      message: json["message"] ?? "Api Response",
      data: json["data"] != null && fromJson != null
          ? fromJson(json["data"])
          : null,
    );
  }

  factory ApiResponse.error(String message) {
    return ApiResponse<T>(status: false, message: message, data: null);
  }

  Map<String, dynamic> toJson([T Function(T)? toJson]) {
    return {
      "status": status,
      "message": message,
      "data": data != null && toJson != null ? toJson(data as T) : data,
    };
  }
}
''';
