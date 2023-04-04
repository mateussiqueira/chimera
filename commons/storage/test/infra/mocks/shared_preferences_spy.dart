import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSpy extends Mock implements SharedPreferences {
  Future<SharedPreferencesSpy> get getInstance async => SharedPreferencesSpy();

  When mockSetIntCall() => when(() => setInt(any(), any()));
  void mockSetInt(bool result) =>
      mockSetIntCall().thenAnswer((_) async => result);
  void mockSetIntError() => mockSetIntCall().thenThrow(Exception());

  When mockSetStringCall() => when(() => setString(any(), any()));
  void mockSetString(bool result) =>
      mockSetStringCall().thenAnswer((_) async => result);
  void mockSetStringError() => mockSetStringCall().thenThrow(Exception());

  When mockSetBoolCall() => when(() => setBool(any(), any()));
  void mockSetBool(bool result) =>
      mockSetBoolCall().thenAnswer((_) async => result);
  void mockSetBoolError() => mockSetBoolCall().thenThrow(Exception());

  When mockSetDoubleCall() => when(() => setDouble(any(), any()));
  void mockSetDouble(bool result) =>
      mockSetDoubleCall().thenAnswer((_) async => result);
  void mockSetDoubleError() => mockSetDoubleCall().thenThrow(Exception());

  When mockGetCall() => when(() => get(any()));
  void mockGet(dynamic result) => mockGetCall().thenAnswer((_) async => result);
  void mockGetError() => mockGetCall().thenThrow(Exception());

  When mockRemoveCall() => when(() => remove(any()));
  void mockRemove() => mockRemoveCall().thenAnswer((_) async => true);
  void mockRemoveError() => mockRemoveCall().thenThrow(Exception());
}
