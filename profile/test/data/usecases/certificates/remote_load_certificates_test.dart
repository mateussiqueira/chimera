import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/src/data/data.dart';

main() {
  late RemoteLoadCertificates sut;
  late HttpClientSpy httpClient;
  late String url;

  late LoadAccountSpy loadAccount;
  late String token;
  late String refreshToken;

  List<Map<String, dynamic>> mockValidData() => [
        {
          "id": "string",
          "recipient_name": "string",
          "course_name": "string",
          "duration_in_hours": 0,
          "completed_at": "2022-12-14T11:57:06.670Z"
        },
        {
          "id": "string",
          "recipient_name": "string",
          "course_name": "string",
          "duration_in_hours": 0,
          "completed_at": "2022-12-14T11:57:06.670Z"
        }
      ];

  final certificates =
      RemoteLoadCertificatesModel.fromJson(mockValidData()).toListEntity();

  setUp(() {
    token = faker.guid.guid();
    refreshToken = faker.guid.guid();
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    loadAccount = LoadAccountSpy();

    sut = RemoteLoadCertificates(
      client: httpClient,
      loadAccount: loadAccount,
      url: url,
    );

    httpClient.mockRequest(mockValidData());
    loadAccount.mockLoad(
        account: AccountEntity(token: token, refreshToken: refreshToken));
  });

  test('Should call Load with correct values', () async {
    await sut.load();

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(token),
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

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.load();

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return Certificates if Load success', () async {
    final future = await sut.load();

    expect(certificates, future);
  });
}
