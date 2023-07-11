import 'package:honey_bee/layers/infra/dto/dto.dart';

abstract class IAuthDatasource {
  Future<TokenDTO> getUserToken();
}
