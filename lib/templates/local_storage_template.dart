String localStorageTemplate() => '''
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final String _key;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  LocalStorage(this._key);

  // Save data to local storage
  Future<void> saveData(dynamic data) async {
    await _storage.write(key: _key, value: jsonEncode(data));
  }

  // Retrieve data from local storage
  Future<dynamic> getData() async {
    final data = await _storage.read(key: _key);
    jsonDecode(data.toString());
  }

  // Clear local storage
  Future<void> clear() async {
    await _storage.delete(key: _key);
  }
}
''';
