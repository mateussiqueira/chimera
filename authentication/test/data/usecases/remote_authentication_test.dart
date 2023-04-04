import 'package:authentication/src/data/helpers/helpers.dart';
import 'package:authentication/src/data/usecases/usecases.dart';
import 'package:authentication/src/domain/usecases/params/params.dart';
import 'package:dependencies/dependencies.dart';
import 'package:test/test.dart';

main() {
  late HttpClientSpy client;
  late RemoteAuthentication sut;
  late String url;
  late AuthenticationParams params;
  final accessToken = faker.guid.guid();
  final refreshToken = faker.guid.guid();

  Map mockValidData() => {"token": accessToken, "refresh_token": refreshToken};

  setUp(() {
    client = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(client: client, url: url);
    params = AuthenticationParams(
        email: faker.internet.email(), password: faker.internet.password());

    client.mockRequest(mockValidData());
  });

  test('Should call Auth with correct values', () async {
    await sut.auth(params: params);

    verify(
      () => client.request(
        url: url,
        method: HttpMethod.post.name,
        body: {
          'email': params.email,
          'password': params.password,
        },
      ),
    );
  });

  test('Should return an Account if call Auth success', () async {
    client.mockRequest(mockValidData());

    final account = await sut.auth(params: params);

    expect(account.token, mockValidData()['token']);
  });

  test('Should throw InvalidCredentialsError if credentials is wrong',
      () async {
    client.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'xx',
        message: 'xx',
      ),
    );

    final future = sut.auth(params: params);

    expect(future, throwsA(const TypeMatcher<InvalidCredentialsError>()));
  });

  test('Should throw UnexpectedError if call Account fail', () async {
    client.mockRequestError(BadRequest(statusCode: 400));

    final future = sut.auth(params: params);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });
}
