import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';

@visibleForTesting
class HttpResponseSpy extends Mock implements HttpResult {
  When get mockHandleCall => when(
        () => handle(
          any(),
        ),
      );

  void mockHandle(dynamic res) => mockHandleCall.thenAnswer(
        (_) async => res,
      );

  void mockHandleError(HttpError error) => when(
        () => mockHandleCall.thenThrow(error),
      );
}
