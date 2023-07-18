// mocks.dart
// ignore_for_file: no-empty-block

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:honey_bee/core/network/http_client/i_http_client.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  IHttpClient,
  FlutterSecureStorage,
])
void main() {}
