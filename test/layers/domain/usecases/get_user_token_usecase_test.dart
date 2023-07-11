import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honey_bee/core/error/failure.dart';
import 'package:honey_bee/layers/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  group('getUserTokenUsecase', () {
    late GetUserTokenUseCase usecase;
    late MockIAuthRepository repository;

    setUp(() {
      repository = MockIAuthRepository();
      usecase = GetUserTokenUseCase(repository);
    });

    final tTokenEntity = TokenEntity(token: "asdsadsad", tokenExpirationAt: DateTime.now());
    test('should return a token entity when success', () async {
      // arrange
      when(repository.getUserToken()).thenAnswer((_) async => Right(tTokenEntity));
      // act
      final response = await usecase();
      // assert
      expect(response, Right(tTokenEntity));
      verify(repository.getUserToken());
      verifyNoMoreInteractions(repository);
    });

    test('should return an UsecaseException when the usecase fails', () async {
      //arrange
      when(repository.getUserToken()).thenAnswer((_) async => Left(ServerFailure()));
      //act
      final response = await usecase();
      //assert
      expect(response, Left(ServerFailure()));
      verify(repository.getUserToken());
      verifyNoMoreInteractions(repository);
    });
  });
}
