import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honey_bee/layers/domain/domain.dart';

void main() {
  group('UserEntity', () {
    late UserEntity userEntity;
    Faker faker = Faker();

    setUp(() {
      userEntity = UserEntity(
        id: faker.guid.guid(),
        name: faker.person.name(),
        email: faker.internet.email(),
        photoUrl: faker.image.image(),
        createdAt: DateTime.now(),
      );
    });

    test('copyWith returns a new UserEntity with updated values', () {
      // Arrange
      final newUserEntity = userEntity.copyWith(
        id: faker.guid.guid(),
        name: faker.person.name(),
        email: faker.internet.email(),
        photoUrl: faker.image.image(),
        createdAt: DateTime.now(),
      );

      // Act
      final userEntityString = userEntity.toString();
      final newUserEntityString = newUserEntity.toString();

      // Assert
      expect(userEntityString, isNot(newUserEntityString));
    });

    test('toString returns correct string representation', () {
      // Arrange
      final expectedString =
          'UserEntity(id: ${userEntity.id}, name: ${userEntity.name}, email: ${userEntity.email}, photoUrl: ${userEntity.photoUrl}, createdAt: ${userEntity.createdAt}, updatedAt: ${userEntity.updatedAt}, lastAccessAt: ${userEntity.lastAccessAt})';

      // Act
      final userEntityString = userEntity.toString();

      // Assert
      expect(userEntityString, expectedString);
    });
  });
}
