// mocks.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:honey_bee/core/network/http_client/http_client.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  IHttpClient,
  FlutterSecureStorage,
])
void main() {}
