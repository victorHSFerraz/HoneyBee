import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:honey_bee/core/storage/secure_storage_service.dart';

import 'core/storage/i_storage.dart';

final GetIt getIt = GetIt.instance;

void init() {
  getIt.registerSingleton<IStorage>(const SecureStorageService(secureStorage: FlutterSecureStorage()));
}
