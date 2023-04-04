import 'dart:convert';

import 'package:authentication/src/data/usecases/local_save_account.dart';
import 'package:dependencies/dependencies.dart';
import 'package:test/test.dart';

import '../mocks/mocks.dart';

void main() {
  late LocalSaveAccount sut;
  late SecureStorageSpy secureStorage;
  late String token;
  late String refreshToken;
  late AccountEntity account;

  token = faker.guid.guid();
  refreshToken = faker.guid.guid();

  Map<String, dynamic> mockValidData() =>
      {"token": token, "refresh_token": refreshToken};

  setUp(() {
    account = AccountEntity(token: token, refreshToken: refreshToken);
    secureStorage = SecureStorageSpy();
    sut = LocalSaveAccount(storage: secureStorage);

    secureStorage.mockSave();
  });

  test('Should call save with correct values', () async {
    await sut.save(account: account);

    verify(
      () => secureStorage.save(
        key: 'account',
        value: jsonEncode(mockValidData()),
      ),
    );
  });

  test('Should throw UnexpectedError if save fail', () async {
    secureStorage.mockSaveError();

    final future = sut.save(account: account);

    expect(future, throwsA(GenericException));
  });
}
