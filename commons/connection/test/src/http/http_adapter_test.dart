import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

main() {
  late HttpAdapter sut;
  late HttpResponseSpy responseSpy;
  late ConnectivitySpy connectivitySpy;
  late ClientSpy client;
  late String url;
  late Response httpResponse;

  setUp(() {
    client = ClientSpy();
    connectivitySpy = ConnectivitySpy();
    responseSpy = HttpResponseSpy();

    sut = HttpAdapter(
      client: client,
      networkConnection: NetworkConnectionAdapter.testFactory(
        connectivity: connectivitySpy,
      ),
      httpResult: responseSpy,
    );

    connectivitySpy.mockCheckConnectivitySuccess();

    responseSpy.mockHandle({'any_key': 'any_value'});
  });

  setUpAll(() {
    url = faker.internet.httpUrl();
    httpResponse = Response("{'any_key': 'any_value'}", 200);
    registerFallbackValue(Uri.parse(url));
    registerFallbackValue(httpResponse);
  });

  group('shared', () {
    test('Should throw ServerError if invalid method is provided', () async {
      final future = sut.request(
        url: url,
        method: 'invalid_method',
      );

      expect(future, throwsA(const TypeMatcher<ServerError>()));
    });

    test('Should throw NoInternet if Connectivity return Exception', () async {
      connectivitySpy.mockCheckConnectivityError();
      final future = sut.request(
        url: url,
        method: 'invalid_method',
      );

      expect(future, throwsA(const TypeMatcher<NoInternetError>()));
    });
  });
  group('post', () {
    test('Should call post with correct values', () async {
      await sut.request(
          url: url, body: {"any_key": "any_value"}, method: 'post');

      verify(
        () => client.post(Uri.parse(url),
            headers: {
              'content-type': 'application/json',
              'accept': 'application/json'
            },
            body: '{"any_key":"any_value"}'),
      );
    });

    test('Should call post whitout body', () async {
      await sut.request(url: url, method: 'post');

      verify(
        () => client.post(any(), headers: any(named: 'headers')),
      );
    });

    test('Should return data if post returns 200', () async {
      final response = await sut.request(url: url, method: 'post');

      expect(response.data, {'any_key': 'any_value'});
    });

    test('Should return null if post returns with no data', () async {
      client.mockPost(200, body: '');
      responseSpy.mockHandle({});

      final response = await sut.request(url: url, method: 'post');

      expect(response.data, {});
    });

    test('Should return null if post returns 201', () async {
      client.mockPost(201, body: '');
      responseSpy.mockHandle({});

      final response = await sut.request(url: url, method: 'post');

      expect(response.data, {});
    });

    test('Should return null if post returns 204 with data', () async {
      client.mockPost(204, body: '');
      responseSpy.mockHandle({});

      final response = await sut.request(url: url, method: 'post');

      expect(response.data, {});
    });

    test('Should return BadRequestError if post returns 400', () async {
      client.mockPost(400, body: '');
      responseSpy.mockHandleError(BadRequest(statusCode: 400));

      final future = sut.request(url: url, method: 'post');

      expect(future, throwsA(const TypeMatcher<BadRequest>()));
    });

    test('Should return UnauthorizedError if post returns 401', () async {
      client.mockPost(401, body: '');
      responseSpy.mockHandleError(NotAuthorizedError(statusCode: 401));

      final future = sut.request(url: url, method: 'post');

      expect(future, throwsA(const TypeMatcher<NotAuthorizedError>()));
    });

    test('Should return ForbiddenError if post returns 403', () async {
      client.mockPost(403, body: '');
      responseSpy.mockHandleError(ForbiddenError(statusCode: 403));

      final future = sut.request(url: url, method: 'post');

      expect(future, throwsA(const TypeMatcher<ForbiddenError>()));
    });

    test('Should return NotFoundError if post returns 404', () async {
      client.mockPost(404, body: '');
      responseSpy.mockHandleError(NotFound(statusCode: 404));

      final future = sut.request(url: url, method: 'post');

      expect(future, throwsA(const TypeMatcher<NotFound>()));
    });

    test('Should return ServerError if post returns 500', () async {
      client.mockPost(500, body: '');
      responseSpy.mockHandleError(ServerError(statusCode: 500));

      final future = sut.request(url: url, method: 'post');

      expect(future, throwsA(const TypeMatcher<ServerError>()));
    });

    test('Should return ServerError if post throws', () async {
      client.mockPostError();

      final future = sut.request(url: url, method: 'post');

      expect(future, throwsA(const TypeMatcher<ServerError>()));
    });
  });
}
