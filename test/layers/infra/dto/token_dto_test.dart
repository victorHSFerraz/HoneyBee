import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:honey_bee/layers/infra/infra.dart';
import 'package:honey_bee/layers/domain/domain.dart';

void main() {
  group('TokenDTO', () {
    Faker faker = Faker();

    final tTokenDTO = TokenDTO(
      token: faker.guid.guid(),
      tokenExpirationAt: DateTime.now().add(const Duration(days: 1)),
    );

    test('should be a subclass of TokenEntity', () => expect(tTokenDTO, isA<TokenEntity>()));

    test('toMap returns a valid map', () {
      // Arrange
      final expectedMap = {
        'token': tTokenDTO.token,
        'tokenExpirationAt': tTokenDTO.tokenExpirationAt.toIso8601String(),
      };
      // Act
      final map = tTokenDTO.toMap();
      // Assert
      expect(map, expectedMap);
    });

    test('fromMap returns a valid TokenDTO', () {
      // Arrange
      final map = {
        'token': tTokenDTO.token,
        'tokenExpirationAt': tTokenDTO.tokenExpirationAt.toIso8601String(),
      };
      // Act
      final tokenDTO = TokenDTO.fromMap(map);
      // Assert
      expect(tokenDTO, tTokenDTO);
    });
  });
}
