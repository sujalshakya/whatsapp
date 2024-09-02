import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  setToken(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  getToken(String key) async {
    String? value = await storage.read(key: key);
    print('data read : $value');
  }

  deleteToken(String key) async {
    await storage.delete(key: key);
  }
}
