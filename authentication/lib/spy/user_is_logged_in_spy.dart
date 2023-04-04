import 'package:dependencies/dependencies.dart'
    show Mock, When, when, UserIsLoggedIn;
import 'package:flutter/foundation.dart';

@visibleForTesting
class UserIsLoggedInSpy extends Mock implements UserIsLoggedIn {
  When mockVerifyCall() => when(() => verify());

  void mockVerify(bool isLoggedIn) =>
      mockVerifyCall().thenAnswer((_) async => isLoggedIn);

  void mockLoadError() => mockVerifyCall().thenThrow(Exception());
}
