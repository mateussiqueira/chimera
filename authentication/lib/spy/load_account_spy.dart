import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';

@visibleForTesting
class LoadAccountSpy extends Mock implements LoadAccount {
  final accountEntityMock = AccountEntity(
    token: faker.guid.guid(),
    refreshToken: faker.guid.guid(),
  );

  When mockLoadCall() => when(() => load());

  void mockLoad({AccountEntity? account}) => mockLoadCall().thenAnswer(
        (_) async => account ?? accountEntityMock,
      );

  void mockLoadError() => mockLoadCall().thenThrow(Exception());
}
