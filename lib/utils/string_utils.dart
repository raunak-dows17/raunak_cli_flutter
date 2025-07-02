import 'dart:io';

class StringUtils {
  static String toPascalCase(String input) {
    return input
        .split(RegExp(r'[\s_\-]+'))
        .map((word) => word.isEmpty
        ? ''
        : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join();
  }

  static String toCamelCase(String input) {
    String pascal = toPascalCase(input);
    if (pascal.isEmpty) return '';
    return pascal[0].toLowerCase() + pascal.substring(1);
  }

  static String? prompt(String message) {
    stdout.write("$message ");
    return stdin.readLineSync();
  }
}
