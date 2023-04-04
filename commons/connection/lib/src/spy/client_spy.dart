import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

@visibleForTesting
class ClientSpy extends Mock implements Client {
  ClientSpy() {
    mockPost(200);
  }

  When get mockPostCall => when(
        () => this.post(
          any(),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
        ),
      );

  void mockPost(
    int statusCode, {
    String body = '{"any_key":"any_value"}',
  }) {
    return mockPostCall.thenAnswer(
      (_) async => Response(
        body,
        statusCode,
      ),
    );
  }

  void mockPostError() {
    return mockPostCall.thenThrow(Exception());
  }
}
