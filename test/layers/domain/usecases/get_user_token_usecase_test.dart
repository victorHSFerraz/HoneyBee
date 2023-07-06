import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:honey_bee/layers/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  group('getUserTokenUsecase', () {
    late MockIAuthRepository mockAuthRepository;
    late GetUserTokenUseCase useCase;
    Faker faker = Faker();

    setUp(() {
      mockAuthRepository = MockIAuthRepository();
      useCase = GetUserTokenUseCase(mockAuthRepository);
    });

    final tTokenEntity = TokenEntity(token: faker.guid.guid(), tokenExpirationAt: DateTime.now());

    test('should get token from the repository', () async {
      // arrange
      when(mockAuthRepository.getUserToken()).thenAnswer((_) async => Right(tTokenEntity));

      // act
      final result = await useCase();

      // assert
      expect(result, equals(Right(tTokenEntity)));
      verify(mockAuthRepository.getUserToken());
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return Failure when the repository returns Failure', () async {
      // arrange
      final failure = UsecaseException('Failed to fetch token');
      when(mockAuthRepository.getUserToken()).thenAnswer((_) async => Left(failure));

      // act
      final result = await useCase();

      // assert
      expect(result, equals(Left(failure)));
      verify(mockAuthRepository.getUserToken());
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
