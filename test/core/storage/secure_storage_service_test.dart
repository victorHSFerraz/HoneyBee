import 'package:flutter_test/flutter_test.dart';
import 'package:honey_bee/core/storage/secure_storage_service.dart';
import 'package:honey_bee/core/storage/storage.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  group('SecureStorageService', () {
    late IStorage storage;
    late MockFlutterSecureStorage mockSecureStorage;

    setUp(() {
      mockSecureStorage = MockFlutterSecureStorage();
      storage = SecureStorageService(secureStorage: mockSecureStorage);
    });

    test('should writes to secure storage', () async {
      //arrange
      when(mockSecureStorage.write(key: anyNamed('key'), value: anyNamed('value'))).thenAnswer((_) async {});
      //act
      await storage.save('token', 'value');
      //assert
      verify(mockSecureStorage.write(key: 'token', value: 'value')).called(1);
    });

    test('should read from secure storage', () async {
      //arrange
      when(mockSecureStorage.read(key: anyNamed('key'))).thenAnswer((_) async => 'value');
      //act
      final result = await storage.get('token');
      //assert
      expect(result, 'value');
      verify(mockSecureStorage.read(key: 'token')).called(1);
    });

    test('should remove key from secure storage', () async {
      //arrange
      when(mockSecureStorage.delete(key: anyNamed('key'))).thenAnswer((_) async {});
      //act
      await storage.delete('token');
      //assert
      verify(mockSecureStorage.delete(key: 'token')).called(1);
    });

    test('should removes all data from secure storage', () async {
      //arrange
      when(mockSecureStorage.deleteAll()).thenAnswer((_) async {});
      //act
      await storage.clear();
      //assert
      verify(mockSecureStorage.deleteAll()).called(1);
    });
  });
}
