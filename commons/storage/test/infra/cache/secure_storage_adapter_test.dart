import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storage/src/infra/infra.dart';
import '../mocks/mocks.dart';

main() {
  late FlutterSecureStorageSpy secureStorage;
  late SecureStorageAdapter sut;
  late String key;
  late String value;

  setUp(() {
    key = faker.lorem.word();
    value = faker.guid.guid();
    secureStorage = FlutterSecureStorageSpy();
    secureStorage.mockFetch(value);

    sut = SecureStorageAdapter(secureStorage: secureStorage);
  });

  group('save', () {
    test('Should call save secure with correct values', () async {
      secureStorage.mockSave();

      await sut.save(key: key, value: value);

      verify(() => secureStorage.write(key: key, value: value));
    });

    test('Should throw if save secure throw', () async {
      secureStorage.mockSaveError();

      final future = sut.save(key: key, value: value);

      expect(future, throwsA(const TypeMatcher<Exception>()));
    });
  });

  group('fetch', () {
    test('Should call fetch secure with correct values', () async {
      await sut.fetch(key: key);

      verify(() => secureStorage.read(key: key));
    });

    test('Should return correct value on success', () async {
      final fetchValue = await sut.fetch(key: key);

      expect(fetchValue, value);
    });

    test('Should return empty data on success', () async {
      secureStorage.mockFetch(null);

      final future = await sut.fetch(key: key);

      expect(future, null);
    });
  });

  group('delete', () {
    test('Should call delete with correct key', () async {
      secureStorage.mockDelete();

      await sut.delete(key: key);

      verify(() => secureStorage.delete(key: key)).called(1);
    });
    test('Should throw if delete throw', () {
      secureStorage.mockDeleteError();

      final future = sut.delete(key: key);
      expect(future, throwsA(const TypeMatcher<Exception>()));
    });
  });
}
