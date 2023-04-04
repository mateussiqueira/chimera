import 'package:authentication/src/data/usecases/local_remove_account.dart';
import 'package:dependencies/dependencies.dart';
import 'package:test/test.dart';

import '../mocks/mocks.dart';

void main() {
  late LocalRemoveAccount sut;
  late SecureStorageSpy secureStorage;

  setUp(() {
    secureStorage = SecureStorageSpy();
    sut = LocalRemoveAccount(storage: secureStorage);

    secureStorage.mockSave();
  });

  test('Should call remove with correct values', () async {
    await sut.remove();

    verify(
      () => secureStorage.save(
        key: 'account',
        value: null,
      ),
    );
  });

  test('Should throw UnexpectedError if remove fail', () async {
    secureStorage.mockSaveError();

    final future = sut.remove();

    expect(future, throwsA(GenericException));
  });
}
