import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honey_bee/layers/infra/infra.dart';
import 'package:honey_bee/layers/domain/domain.dart';

void main() {
  group('UserDTO', () {
    Faker faker = Faker();

    final tUserDTO = UserDTO(
      id: faker.guid.guid(),
      name: faker.person.name(),
      email: faker.internet.email(),
      photoUrl: faker.internet.httpUrl(),
      createdAt: DateTime.now(),
      authToken: TokenDTO(
        token: faker.guid.guid(),
        tokenExpirationAt: DateTime.now().add(const Duration(days: 1)),
      ),
    );

    test('should be a subclass of UserEntity', () => expect(tUserDTO, isA<UserEntity>()));

    test('toMap returns a valid map', () {
      // Arrange
      final expectedMap = {
        'id': tUserDTO.id,
        'name': tUserDTO.name,
        'email': tUserDTO.email,
        'photoUrl': tUserDTO.photoUrl,
        'createdAt': tUserDTO.createdAt.toIso8601String(),
        'authToken': {
          'token': tUserDTO.authToken.token,
          'tokenExpirationAt': tUserDTO.authToken.tokenExpirationAt.toIso8601String(),
        },
      };
      // Act
      final map = tUserDTO.toMap();
      // Assert
      expect(map, expectedMap);
    });

    test('fromMap returns a valid UserDTO', () {
      // Arrange
      final map = {
        'id': tUserDTO.id,
        'name': tUserDTO.name,
        'email': tUserDTO.email,
        'photoUrl': tUserDTO.photoUrl,
        'createdAt': tUserDTO.createdAt.toIso8601String(),
        'authToken': {
          'token': tUserDTO.authToken.token,
          'tokenExpirationAt': tUserDTO.authToken.tokenExpirationAt.toIso8601String(),
        },
      };
      // Act
      final userDTO = UserDTO.fromMap(map);
      // Assert
      expect(userDTO, tUserDTO);
    });
  });
}
