import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mockData/mock_data.dart';

main() {
  late RemoteLoadCategories sut;
  late HttpClientSpy httpClient;
  late String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();

    sut = RemoteLoadCategories(
      client: httpClient,
      url: url,
    );

    httpClient.mockRequest(categoriesMockValidData());
  });

  test('Should call Load with correct values', () async {
    await sut.load();

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.get.name,
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

  test('Should return Categories if Load success', () async {
    final future = await sut.load();

    expect(categoriesMockValidEntity(), future);
  });
}
