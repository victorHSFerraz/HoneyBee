import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'i_storage.dart';

class SecureStorageService implements IStorage {
  final FlutterSecureStorage secureStorage;

  const SecureStorageService({required this.secureStorage});

  @override
  Future<void> save(String key, dynamic value) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<dynamic> get(String key) async {
    return await secureStorage.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    await secureStorage.delete(key: key);
  }

  @override
  Future<void> clear() async {
    await secureStorage.deleteAll();
  }
}
