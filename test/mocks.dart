// mocks.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:honey_bee/core/network/http_client/http_client.dart';
import 'package:honey_bee/layers/domain/domain.dart';
import 'package:honey_bee/layers/infra/datasources/auth/auth_datasource.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  IAuthRepository,
  IAuthDatasource,
  IHttpClient,
  FlutterSecureStorage,
])
void main() {}
