import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';

@visibleForTesting
class HttpClientSpy extends Mock implements HttpClient {
  When mockRequestCall() => when(
        () => request(
          url: any(named: 'url'),
          method: any(named: 'method'),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
          queryParameters: any(named: 'queryParameters'),
        ),
      );

  void mockRequest(dynamic data) => mockRequestCall().thenAnswer(
        (_) async => HttpResponse(data: data),
      );

  void mockRequestError(GenericException error) =>
      mockRequestCall().thenThrow(error);

  When mockResetCall() => when(
        () => request(
          url: any(named: 'url'),
          method: any(named: 'method'),
          headers: any(named: 'headers'),
          body: any(named: 'body'),
        ),
      );

  void mockReset() => mockResetCall().thenAnswer(
        (_) async => _,
      );

  void mockResetError(HttpError error) => mockResetCall().thenThrow(
        error,
      );
}
