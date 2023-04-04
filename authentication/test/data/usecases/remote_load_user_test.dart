import 'package:authentication/src/data/models/models.dart';
import 'package:authentication/src/data/usecases/usecases.dart';
import 'package:dependencies/dependencies.dart';
import 'package:test/test.dart';

main() {
  late RemoteLoadUser sut;
  late HttpClientSpy httpClient;
  late String url;

  late String id;
  late String name;
  late String email;

  late LoadAccountSpy loadAccount;
  late String token;

  id = faker.guid.guid();
  name = faker.internet.userName();
  email = faker.internet.email();
  token = faker.guid.guid();

  Map<String, dynamic> mockValidData() =>
      {"id": id, "name": name, "email": email};

  setUp(() {
    id = faker.guid.guid();
    name = faker.internet.userName();
    email = faker.internet.email();
    token = faker.guid.guid();

    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    loadAccount = LoadAccountSpy();

    sut = RemoteLoadUser(
      client: httpClient,
      url: url,
      loadAccount: loadAccount,
    );

    httpClient.mockRequest(mockValidData());
  });
  test('Should call Load with correct values', () async {
    await sut.load();

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(
          token,
        ),
      ),
    );
  });

  test('Should throw UnexpectedError if Load fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'NotFound',
      ),
    );

    final future = sut.load();

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should return an User if Load success', () async {
    final validData = mockValidData();
    httpClient.mockRequest(validData);
    final account = await sut.load();

    expect(account, RemoteUserModel.fromJson(validData).toEntity());
  });
}
