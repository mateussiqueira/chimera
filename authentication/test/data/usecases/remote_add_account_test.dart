import 'package:authentication/src/data/helpers/already_exists_account.dart';
import 'package:authentication/src/data/models/models.dart';
import 'package:authentication/src/data/params/params.dart';
import 'package:authentication/src/data/usecases/remote_add_account.dart';
import 'package:authentication/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';
import 'package:test/test.dart';

main() {
  late RemoteAddAccount sut;
  late AddAccountParams params;
  late HttpClientSpy httpClient;
  late String url;
  late String name;
  late String email;
  late String password;
  late String token;
  late String refreshToken;

  token = faker.guid.guid();
  refreshToken = faker.guid.guid();

  Map<String, dynamic> mockValidData() =>
      {"token": token, "refresh_token": refreshToken};

  setUp(() {
    token = faker.guid.guid();
    refreshToken = faker.guid.guid();

    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAddAccount(
      httpClient: httpClient,
      url: url,
    );

    name = faker.internet.userName();
    email = faker.internet.email();
    password = faker.internet.password();

    params = AddAccountParams(email: email, password: password, name: name);

    httpClient.mockRequest(mockValidData());
  });

  test('Should call Add with correct values', () async {
    await sut.add(params);

    verify(() => httpClient.request(
          url: url,
          method: HttpMethod.post.name,
          body: RemoteAddAccountParams.fromDomain(params).toJson(),
        ));
  });

  test('Should throw UnexpectedError if call Add fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'Already exists',
      ),
    );

    final future = sut.add(params);

    expect(future, throwsA(const TypeMatcher<AlreadyExistsAccountError>()));
  });

  test('Should return an Account if call add success', () async {
    final validData = mockValidData();
    httpClient.mockRequest(validData);
    final account = await sut.add(params);

    expect(account, RemoteAccountModel.fromJson(validData).toEntity());
  });
}
