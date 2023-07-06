import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honey_bee/layers/domain/domain.dart';

void main() {
  group('TokenEntity', () {
    late TokenEntity tokenEntity;
    Faker faker = Faker();

    test('isUserLogged returns true when token is not empty and not expired', () {
      // Arrange
      final tokenExpirationAt = DateTime.now().add(const Duration(days: 1));
      tokenEntity = TokenEntity(token: 'testToken', tokenExpirationAt: tokenExpirationAt);

      // Act
      final isUserLogged = tokenEntity.isUserLogged;

      // Assert
      expect(isUserLogged, true);
    });

    test('isUserLogged returns false when token is empty', () {
      // Arrange
      tokenEntity = TokenEntity(token: '', tokenExpirationAt: DateTime.now().add(const Duration(days: 1)));

      // Act
      final isUserLogged = tokenEntity.isUserLogged;

      // Assert
      expect(isUserLogged, false);
    });

    test('isUserLogged returns false when token is expired', () {
      // Arrange
      final tokenExpirationAt = DateTime.now().subtract(const Duration(days: 1));
      tokenEntity = TokenEntity(token: 'testToken', tokenExpirationAt: tokenExpirationAt);

      // Act
      final isUserLogged = tokenEntity.isUserLogged;

      // Assert
      expect(isUserLogged, false);
    });

    test('isTokenExpired returns false when current time is before token expiration time', () {
      // Arrange
      final tokenExpirationAt = DateTime.now().add(const Duration(days: 1));
      tokenEntity = TokenEntity(token: 'testToken', tokenExpirationAt: tokenExpirationAt);

      // Act
      final isTokenExpired = tokenEntity.isTokenExpired;

      // Assert
      expect(isTokenExpired, false);
    });

    test('isTokenExpired returns true when current time is after token expiration time', () {
      // Arrange
      final tokenExpirationAt = DateTime.now().subtract(const Duration(days: 1));
      tokenEntity = TokenEntity(token: 'testToken', tokenExpirationAt: tokenExpirationAt);

      // Act
      final isTokenExpired = tokenEntity.isTokenExpired;

      // Assert
      expect(isTokenExpired, true);
    });

    test('copyWith returns a new TokenEntity with updated values', () {
      // Arrange
      tokenEntity = TokenEntity(token: faker.guid.guid(), tokenExpirationAt: DateTime.now());
      // Act
      final newTokenEntity = tokenEntity.copyWith(
        token: faker.guid.guid(),
        tokenExpirationAt: DateTime.now(),
      );
      // Assert
      expect(tokenEntity, isNot(newTokenEntity));
    });

    test('toString returns correct string representation', () {
      // Arrange
      tokenEntity = TokenEntity(token: faker.guid.guid(), tokenExpirationAt: DateTime.now());
      final expectedString = 'AuthEntity(token: ${tokenEntity.token}, tokenExpirationAt: ${tokenEntity.tokenExpirationAt})';

      // Act
      final tokenEntityString = tokenEntity.toString();

      // Assert
      expect(tokenEntityString, expectedString);
    });
  });
}
