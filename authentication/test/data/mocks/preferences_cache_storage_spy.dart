import 'package:dependencies/dependencies.dart';

class PreferencesCacheStorageSpy extends Mock implements CacheStorage {
  final String key;

  PreferencesCacheStorageSpy({required this.key});

  When mockSaveCall() => when(() => save(key: key, value: any(named: 'value')));

  void mockSave() => mockSaveCall().thenAnswer((_) async => _);
  void mockSaveError() => mockSaveCall().thenThrow(Exception());

  When mockFetchCall() => when(() => fetch(key: any(named: 'key')));

  void mockfetch(dynamic answer) =>
      mockFetchCall().thenAnswer((_) async => answer);

  void mockFetchError() => mockFetchCall().thenThrow(Exception());
}
