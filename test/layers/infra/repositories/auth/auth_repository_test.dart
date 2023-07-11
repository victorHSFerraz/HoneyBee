import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:honey_bee/layers/domain/domain.dart';

import '../../../../mocks.mocks.dart';

//red/green/refactor

void main() {
  late MockIAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockIAuthRepository();
  });

  group('getUserToken', () {
    final tTokenEntity = TokenEntity(token: '1234567890', tokenExpirationAt: DateTime.now());

    test('should return TokenEntity when call to getUserToken is successful', () async {
      // Arrange
      when(mockAuthRepository.getUserToken()).thenAnswer((_) async => Right(tTokenEntity));
      // Act
      final result = await mockAuthRepository.getUserToken();
      // Assert
      expect(result, equals(Right(tTokenEntity)));
    });

    test('should return Failure when call to getUserToken is unsuccessful', () async {
      // Arrange
      when(mockAuthRepository.getUserToken()).thenAnswer((_) async => Left(UsecaseException("Failed to fetch token")));
      // Act
      final result = await mockAuthRepository.getUserToken();
      // Assert
      expect(result, equals(Left(UsecaseException("Failed to fetch token"))));
    });
  });
}
