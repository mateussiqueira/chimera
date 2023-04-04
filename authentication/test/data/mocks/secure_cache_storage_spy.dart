import 'package:dependencies/dependencies.dart';

class SecureStorageSpy extends Mock implements SecureCacheStorage {
  When mockSaveCall() => when(
        () => save(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      );

  void mockSave() => mockSaveCall().thenAnswer((_) async => _);

  void mockSaveError() => mockSaveCall().thenThrow(Exception());

  When mockDeleteCall() => when(
        () => delete(
          key: any(named: 'key'),
        ),
      );

  void mockDelete() => mockDeleteCall().thenAnswer((_) async => _);

  void mockDeleteError() => mockDeleteCall().thenThrow(Exception());

  When mockFetchCall() => when(
        () => fetch(
          key: any(named: 'key'),
        ),
      );

  void mockFetch(String? data) => mockFetchCall().thenAnswer((_) async => data);

  void mockFetchError() => mockFetchCall().thenThrow(Exception());
}
