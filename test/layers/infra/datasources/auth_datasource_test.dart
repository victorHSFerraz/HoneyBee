import 'package:flutter_test/flutter_test.dart';
import 'package:honey_bee/core/core.dart';
import 'package:honey_bee/core/network/http_client/http_client.dart';
import 'package:honey_bee/layers/infra/infra.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';
import '../../../mocks/token_map_mock.dart';

void main() {
  late IAuthDatasource datasource;
  late MockIHttpClient httpClient;

  setUp(() {
    httpClient = MockIHttpClient();
    datasource = AuthDatasource(httpClient: httpClient);
  });

  test('shoud call the get method with correct url', () async {
    // arrange
    when(httpClient.get(any)).thenAnswer((_) async => HttpResponse(data: tokenMapMock, statusCode: 200));
    //act
    await datasource.getUserToken();
    //assert
    verify(httpClient.get('/auth/token')).called(1);
  });

  test('should return a TokenDTO when the request is successful', () async {
    // arrange
    when(httpClient.get(any)).thenAnswer((_) async => HttpResponse(data: tokenMapMock, statusCode: 200));
    //act
    final result = await datasource.getUserToken();
    //assert
    expect(result, isA<TokenDTO>());
  });

  test('should throw a ServerException when the request is unsuccessful', () async {
    // arrange
    when(httpClient.get(any)).thenAnswer((_) async => HttpResponse(data: 'error', statusCode: 400));
    //act
    final call = datasource.getUserToken;
    //assert
    expect(() => call(), throwsA(isA<ServerException>()));
  });
}
