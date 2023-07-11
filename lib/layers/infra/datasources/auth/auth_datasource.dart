import '../../infra.dart';

abstract class IAuthDatasource {
  Future<TokenDTO> getUserToken();
}
