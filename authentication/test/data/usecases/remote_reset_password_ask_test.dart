import 'package:authentication/src/data/usecases/usecases.dart';
import 'package:dependencies/dependencies.dart';
import 'package:test/test.dart';

main() {
  late RemoteResetPasswordAsk sut;

  late HttpClientSpy httpClient;
  late String url;

  late String email;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteResetPasswordAsk(
      httpClient: httpClient,
      url: url,
    );

    email = faker.internet.email();

    Map<String, dynamic> mockValidData() => {"sent": true};
    httpClient.mockRequest(mockValidData());
  });

  test('Should call Ask with correct values', () async {
    await sut.ask(email: email);

    verify(() => httpClient.request(
          url: url,
          method: HttpMethod.post.name,
          body: {"email": email},
        ));
  });

  test('Should return true if call Ask success', () async {
    final future = await sut.ask(email: email);

    expect(future, true);
  });
  test('Should throw UnexpectedError if call Ask fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'email not exists',
      ),
    );
  });
}
