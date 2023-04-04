import 'package:authentication/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

class SaveAccountSpy extends Mock implements SaveAccount {
  When mockSaveCall() => when(
        () => save(
          account: any(named: 'account'),
        ),
      );

  void mockSave() => mockSaveCall().thenAnswer((_) async => _);

  void mockLoadError() => mockSaveCall().thenThrow(Exception());
}
