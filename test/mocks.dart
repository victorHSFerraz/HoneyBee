// mocks.dart
import 'package:honey_bee/core/http_client/http_client.dart';
import 'package:honey_bee/layers/domain/domain.dart';
import 'package:honey_bee/layers/infra/datasources/auth/auth_datasource.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([IAuthRepository, IAuthDatasource, IHttpClient])
void main() {}
