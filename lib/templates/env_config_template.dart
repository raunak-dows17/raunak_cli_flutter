String envConfigTemplate() => """
    import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static final _env = dotenv.env;

  // API configuration
  static String get baseUrl => _env['BASE_URL'] ?? "";
}
    """;
