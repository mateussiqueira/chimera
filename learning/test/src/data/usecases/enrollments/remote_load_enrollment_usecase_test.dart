import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/data.dart';

import '../../../mocks/mocks.dart';

main() {
  late RemoteLoadEnrollmentUseCase sut;
  late HttpClientSpy httpClient;
  late String url;
  late LoadAccountSpy loadAccount;
  late String id;

  setUp(() {
    httpClient = HttpClientSpy();
    loadAccount = LoadAccountSpy();
    url = faker.internet.httpUrl();
    id = faker.guid.guid();

    sut = RemoteLoadEnrollmentUseCase(
      loadAccount: loadAccount,
      client: httpClient,
      url: url,
    );

    loadAccount.mockLoad();

    httpClient.mockRequest(mockEnrollmentValidData);
  });

  test('Should call Load with correct values', () async {
    await sut.load(id: id);

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(loadAccount.accountEntityMock.token),
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

    final future = sut.load(id: id);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.load(id: id);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return Enrollments if Load success', () async {
    final enrollments = await sut.load(id: id);

    expect(
      enrollments,
      RemoteEnrollmentModel.fromJson(mockEnrollmentValidData),
    );
  });
}
