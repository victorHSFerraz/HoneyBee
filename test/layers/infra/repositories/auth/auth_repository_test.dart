import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honey_bee/core/core.dart';
import 'package:honey_bee/layers/infra/infra.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks.mocks.dart';

void main() {
  group('getUserToken', () {
    late MockIAuthDatasource datasource;
    late AuthRepository repository;

    setUp(() {
      datasource = MockIAuthDatasource();
      repository = AuthRepository(datasource);
    });

    final tTokenDTO = TokenDTO(token: "sabdubsaudh", tokenExpirationAt: DateTime.now());

    test('should return an TokenDTO when calls the datasource', () async {
      //arrange
      when(datasource.getUserToken()).thenAnswer((_) async => tTokenDTO);
      //act
      final response = await repository.getUserToken();
      //assert
      expect(response, Right(tTokenDTO));
      verify(datasource.getUserToken());
      verifyNoMoreInteractions(datasource);
    });

    test('should return an server failure when the call to datasource fails', () async {
      //arrange
      when(datasource.getUserToken()).thenThrow(ServerException());
      //act
      final response = await repository.getUserToken();
      //assert
      expect(response, Left(ServerFailure()));
      verify(datasource.getUserToken());
      verifyNoMoreInteractions(datasource);
    });
  });
}
