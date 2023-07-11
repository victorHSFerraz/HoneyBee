// mocks.dart
import 'package:honey_bee/layers/domain/domain.dart';
import 'package:honey_bee/layers/infra/datasources/auth/auth_datasource.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([IAuthRepository, IAuthDatasource])
void main() {}
