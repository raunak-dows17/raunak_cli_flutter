String apiEndPointTemplate() => '''
import 'package:{{projectName}}/config/env/env.config.dart';

class ApiEndPoints {
  static String get baseUrl => EnvConfig.baseUrl;
}
''';
