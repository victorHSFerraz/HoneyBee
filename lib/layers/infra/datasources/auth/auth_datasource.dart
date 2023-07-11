import 'package:honey_bee/core/core.dart';
import 'package:honey_bee/core/http_client/http_client.dart';

import '../../infra.dart';

abstract class IAuthDatasource {
  Future<TokenDTO> getUserToken();
}

class AuthDatasource implements IAuthDatasource {
  final IHttpClient httpClient;

  AuthDatasource({required this.httpClient});

  @override
  Future<TokenDTO> getUserToken() async {
    final response = await httpClient.get('/auth/token');
    if (response.statusCode == 200) {
      return TokenDTO.fromMap(response.data);
    } else {
      throw ServerException();
    }
  }
}
