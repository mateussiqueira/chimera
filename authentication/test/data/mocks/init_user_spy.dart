import 'package:authentication/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';

class InitUserSpy extends Mock implements InitUser {
  When _mockInitUserCall() => when(
        () => initUser(
          account: any(
            named: 'account',
          ),
        ),
      );

  void mockInitUser() => _mockInitUserCall().thenAnswer((_) async => _);

  void mockInitUserError() => _mockInitUserCall().thenThrow(Exception());
}
