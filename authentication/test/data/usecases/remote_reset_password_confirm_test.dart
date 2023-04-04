import 'package:authentication/src/data/usecases/usecases.dart';
import 'package:dependencies/dependencies.dart';
import 'package:test/test.dart';

main() {
  late RemoteResetPasswordConfirm sut;

  late HttpClientSpy httpClient;
  late String url;

  late String email;
  late String password;
  late String code;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteResetPasswordConfirm(
      httpClient: httpClient,
      url: url,
    );

    email = faker.internet.email();
    password = faker.internet.password();
    code = faker.internet.random.string(10, min: 4);

    Map<String, dynamic> mockValidData() => {"changed": true};
    httpClient.mockRequest(mockValidData());
  });

  test('Should call Confirm with correct values', () async {
    await sut.confirm(email: email, code: code, password: password);

    verify(() => httpClient.request(
          url: url,
          method: HttpMethod.post.name,
          body: {"email": email, "code": code, "password": password},
        ));
  });

  test('Should throw UnexpectedError if call Confirm fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'email not exists',
      ),
    );

    final future = sut.confirm(email: email, code: code, password: password);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should return true if call Confirm success', () async {
    final future =
        await sut.confirm(email: email, code: code, password: password);

    expect(future, true);
  });
}
