import 'dart:convert';

import 'package:authentication/src/data/usecases/local_load_account.dart';
import 'package:dependencies/dependencies.dart';
import 'package:test/test.dart';

import '../mocks/mocks.dart';

void main() {
  late LocalLoadAccount sut;
  late SecureStorageSpy preferencesCacheStorage;
  late String token;
  late String refreshToken;
  late AccountEntity account;

  token = faker.guid.guid();
  refreshToken = faker.guid.guid();

  Map<String, dynamic> mockValidData() => {
        "token": token,
        "refresh_token": refreshToken,
      };

  setUp(() {
    account = AccountEntity(token: token, refreshToken: refreshToken);
    preferencesCacheStorage = SecureStorageSpy();
    sut = LocalLoadAccount(storage: preferencesCacheStorage);
    preferencesCacheStorage.mockFetch(jsonEncode(mockValidData()));
  });

  test('Should call Load with correct value', () async {
    await sut.load();

    verify(() => preferencesCacheStorage.fetch(key: 'account'));
  });

  test('Should call Load return an Account', () async {
    final future = await sut.load();

    expect(future, account);
  });

  test(
    'Should call Load throw UnexpectedError if load fail',
    () async {
      preferencesCacheStorage.mockFetchError();

      final future = sut.load();

      expect(future, throwsA(GenericException));
    },
  );
}
