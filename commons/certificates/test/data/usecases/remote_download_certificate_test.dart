import 'package:certificates/certificates.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late RemoteDownloadCertificate sut;
  late HttpClientSpy httpClient;
  late String url;

  late LoadAccountSpy loadAccount;
  late String token;
  late String refreshToken;

  late CertificateFileType type;
  late String id;

  Map<String, dynamic> mockValidData() => {
        "url": "string",
      };

  final downloadUrl =
      RemoteDownloadCertificateModel.fromJson(mockValidData()).toEntity();

  setUp(() {
    token = faker.guid.guid();
    refreshToken = faker.guid.guid();
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    loadAccount = LoadAccountSpy();

    type = CertificateFileType.image;
    id = faker.guid.guid();

    sut = RemoteDownloadCertificate(
      client: httpClient,
      loadAccount: loadAccount,
      url: url,
    );

    httpClient.mockRequest(mockValidData());
    loadAccount.mockLoad(
        account: AccountEntity(token: token, refreshToken: refreshToken));
  });

  test('Should call Certificate with correct values', () async {
    await sut.download(
      id: id,
      type: type,
    );

    final endpoint = url.replaceAll('{ID}}', id);

    verify(
      () => httpClient.request(
        url: endpoint,
        method: HttpMethod.post.name,
        headers: getDefaultHeaders(token),
        body: {"type": type},
      ),
    );
  });

  test('Should throw UnexpectedError if Certificate fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'NotFound',
      ),
    );

    final future = sut.download(
      id: id,
      type: type,
    );

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.download(
      id: id,
      type: type,
    );

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return Certificate if Download success', () async {
    final future = await sut.download(
      id: id,
      type: type,
    );

    expect(downloadUrl, future);
  });
}
