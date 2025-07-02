String navigateTempalate() => '''
import 'package:go_router/go_router.dart';

class Navigate {
  static late GoRouter router;

  static void init(GoRouter routerInstance) {
    router = routerInstance;
  }

  static Future<T?> push<T extends Object?>(
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) {
    return router.pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void replace(
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) {
    router.goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void pushReplace(
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) {
    router.pushReplacementNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void pop<T extends Object?>([T? result]) {
    router.pop(result);
  }
}
''';
