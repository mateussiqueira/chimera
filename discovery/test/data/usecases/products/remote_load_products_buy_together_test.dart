import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/data/usecases/products/products.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mockData/mock_data.dart';

main() {
  late RemoteLoadProductsBuyTogether sut;
  late HttpClientSpy httpClient;
  late String url;
  late String id;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    id = faker.guid.guid();

    sut = RemoteLoadProductsBuyTogether(
      client: httpClient,
      url: url,
    );

    httpClient.mockRequest(productsMockValidData());
  });
  test('Should call Load with correct values', () async {
    await sut.load(id: id);

    final endpoint = '$url/$id/products_to_buy_together';

    verify(
      () => httpClient.request(
        url: endpoint,
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

    final future = sut.load(id: id);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.load(id: id);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return Products to Buy Together if Load success', () async {
    final future = await sut.load(id: id);

    expect(productsMockValidEntity(), future);
  });
}
