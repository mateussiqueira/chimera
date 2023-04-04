import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/data.dart';

import '../../../mocks/mocks.dart';

main() {
  late RemoteLoadEnrollmentsUseCase sut;
  late HttpClientSpy httpClient;
  late String url;
  late LoadAccountSpy loadAccount;

  late RemoteLoadEnrollmentsParams params;

  setUp(() {
    params = const RemoteLoadEnrollmentsParams();

    httpClient = HttpClientSpy();
    loadAccount = LoadAccountSpy();
    url = faker.internet.httpUrl();

    sut = RemoteLoadEnrollmentsUseCase(
      loadAccount: loadAccount,
      client: httpClient,
      url: url,
    );

    loadAccount.mockLoad();

    httpClient.mockRequest(mockEnrollmentsValidData);
  });

  test('Should call Load with correct values', () async {
    await sut.load(params: params);

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.get.name,
        queryParameters: params.toQueryParameters,
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

    final future = sut.load(params: params);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.load(params: params);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return Enrollments if Load success', () async {
    final enrollments = await sut.load(params: params);

    expect(
      enrollments,
      RemoteEnrollmentModel.fromJsonList(
        mockEnrollmentsValidData,
        null,
      ),
    );
  });
}
