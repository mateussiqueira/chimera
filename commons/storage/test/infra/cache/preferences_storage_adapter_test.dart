import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';
import 'package:storage/src/infra/infra.dart';
import '../mocks/mocks.dart';

main() {
  late Future<SharedPreferencesSpy> preferencesStorage;
  late PreferencesStorageAdapter sut;
  late String key;
  late String valueString;
  late int valueInt;
  late bool valueBool;
  late double valueDouble;

  setUp(() {
    key = faker.lorem.word();
    valueString = faker.guid.guid();
    valueInt = faker.randomGenerator.integer(10);
    valueBool = faker.randomGenerator.boolean();
    valueDouble = faker.randomGenerator.decimal();
    preferencesStorage = SharedPreferencesSpy().getInstance;

    sut = PreferencesStorageAdapter(preferencesStorage: preferencesStorage);
  });

  group('save', () {
    group('success', () {
      test('Should call save with correct values', () async {
        final storage = await preferencesStorage;
        storage.mockSetInt(true);

        await sut.save(key: key, value: valueInt);

        verify(() => storage.setInt(key, valueInt));
      });
      test('Should call save with correct values', () async {
        final storage = await preferencesStorage;
        storage.mockSetString(true);

        await sut.save(key: key, value: valueString);

        verify(() => storage.setString(key, valueString));
      });

      test('Should call save with correct values', () async {
        final storage = await preferencesStorage;

        storage.mockSetBool(true);

        await sut.save(key: key, value: valueBool);

        verify(() => storage.setBool(key, valueBool));
      });

      test('Should call save with correct values', () async {
        final storage = await preferencesStorage;

        storage.mockSetDouble(true);

        await sut.save(key: key, value: valueDouble);

        verify(() => storage.setDouble(key, valueDouble));
      });
    });
    group('throws', () {
      test('Should throw if save throw', () async {
        final storage = await preferencesStorage;
        storage.mockSetIntError();

        final future = sut.save(key: key, value: valueInt);

        expect(future, throwsA(const TypeMatcher<Exception>()));
      });

      test('Should throw if save throw', () async {
        final storage = await preferencesStorage;
        storage.mockSetStringError();

        final future = sut.save(key: key, value: valueString);

        expect(future, throwsA(const TypeMatcher<Exception>()));
      });
      test('Should throw if save throw', () async {
        final storage = await preferencesStorage;
        storage.mockSetBoolError();

        final future = sut.save(key: key, value: valueBool);

        expect(future, throwsA(const TypeMatcher<Exception>()));
      });

      test('Should throw if save throw', () async {
        final storage = await preferencesStorage;

        storage.mockSetDoubleError();

        final future = sut.save(key: key, value: valueDouble);

        expect(future, throwsA(const TypeMatcher<Exception>()));
      });
    });
  });

  group('fetch', () {
    test('Should call fetch secure with correct values', () async {
      final storage = await preferencesStorage;

      storage.mockGet(valueInt);

      await sut.fetch(key: key);

      verify(() => storage.get(key));
    });

    test('Should return correct value on success', () async {
      final storage = await preferencesStorage;

      storage.mockGet(valueInt);

      final fetchValue = await sut.fetch(key: key);

      expect(fetchValue, valueInt);
    });

    test('Should return nullable value on success', () async {
      final storage = await preferencesStorage;

      storage.mockGet(null);

      final fetchValue = await sut.fetch(key: key);

      expect(fetchValue, null);
    });

    test('Should throw if fetch secure throws', () async {
      final storage = await preferencesStorage;

      storage.mockGetError();

      final future = sut.fetch(key: key);

      expect(future, throwsA(const TypeMatcher<Exception>()));
    });
  });

  group('delete', () {
    test('Should call delete with correct key', () async {
      final storage = await preferencesStorage;

      storage.mockRemove();

      await sut.delete(key: key);

      verify(() => storage.remove(key)).called(1);
    });

    test('Should throw if delete throw', () async {
      final storage = await preferencesStorage;

      storage.mockRemoveError();

      final future = sut.delete(key: key);
      expect(future, throwsA(const TypeMatcher<Exception>()));
    });
  });
}
