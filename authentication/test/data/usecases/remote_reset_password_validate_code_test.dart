import 'package:authentication/src/data/data.dart';
import 'package:dependencies/dependencies.dart';
import 'package:test/test.dart';

main() {
  late RemoteResetPasswordValidateCode sut;

  late HttpClientSpy httpClient;
  late String url;

  late String email;
  late String code;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteResetPasswordValidateCode(
      httpClient: httpClient,
      url: url,
    );

    email = faker.internet.email();
    code = faker.internet.random.string(10, min: 4);

    Map<String, dynamic> mockValidData() => {"valid": true};
    httpClient.mockRequest(mockValidData());
  });

  test('Should call Valid with correct values', () async {
    await sut.validateCode(email: email, code: code);

    verify(() => httpClient.request(
          url: url,
          method: HttpMethod.post.name,
          body: {"email": email, "code": code},
        ));
  });

  test('Should throw UnexpectedError if call Valid fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'email not exists',
      ),
    );

    final future = sut.validateCode(email: email, code: code);

    expect(future, throwsA(const TypeMatcher<ResetInvalidCodeError>()));
  });

  test('Should return true if call Valid success', () async {
    final future = await sut.validateCode(email: email, code: code);

    expect(future, true);
  });
}
