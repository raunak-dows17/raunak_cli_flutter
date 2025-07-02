String tokenStorageTemplate() => '''
import 'package:{{projectName}}/config/storage/local_storage.dart';

class UserToken {
  final LocalStorage _localStorage = LocalStorage("idToken");

  Future<void> saveToken(String token) async {
    await _localStorage.saveData(token);
  }

  Future<String?> getToken() async {
    final data = await _localStorage.getData();
    return data.toString();
  }

  Future<void> cleatToken() async {
    await _localStorage.clear();
  }
}

''';
