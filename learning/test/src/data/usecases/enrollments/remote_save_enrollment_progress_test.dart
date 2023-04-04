import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/data.dart';

main() {
  late RemoteSaveEnrollmentProgress sut;
  late HttpClientSpy httpClient;
  late String url;
  late LoadAccountSpy loadAccount;
  late String enrollmentId;
  late String contentId;

  setUp(() {
    httpClient = HttpClientSpy();
    loadAccount = LoadAccountSpy();
    url = faker.internet.httpUrl();
    enrollmentId = faker.guid.guid();
    contentId = faker.guid.guid();

    sut = RemoteSaveEnrollmentProgress(
      loadAccount: loadAccount,
      client: httpClient,
      url: url,
    );

    loadAccount.mockLoad();

    httpClient.mockRequest({});
  });

  test('Should call save enrollment with correct values', () async {
    await sut.save(enrollmentId: enrollmentId, contentId: contentId);

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.post.name,
        headers: getDefaultHeaders(loadAccount.accountEntityMock.token),
        body: RemoteRemoveProgressParams(id: contentId).toBodyJson,
      ),
    );
  });

  test('Should throw UnexpectedError if save enrollment fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'NotFound',
      ),
    );

    final future = sut.save(enrollmentId: enrollmentId, contentId: contentId);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.save(enrollmentId: enrollmentId, contentId: contentId);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should returns normally if save progress success', () async {
    final result = sut.save(enrollmentId: enrollmentId, contentId: contentId);

    expect(() => result, returnsNormally);
  });
}
