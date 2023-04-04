import 'package:dependencies/dependencies.dart';
import 'package:discovery/src/data/params/params.dart';
import 'package:discovery/src/data/usecases/products/products.dart';
import 'package:discovery/src/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mockData/mock_data.dart';

main() {
  late RemoteLoadProductsUsersBought sut;
  late HttpClientSpy httpClient;
  late String url;
  late String id;
  late LoadProductsParams params;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    id = faker.guid.guid();
    params = RemoteLoadProductsParams(productId: id);

    sut = RemoteLoadProductsUsersBought(
      client: httpClient,
      url: url,
    );

    httpClient.mockRequest(productsMockValidData());
  });
  test('Should call Load with correct values', () async {
    await sut.load(id, params);

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.get.name,
        queryParameters: (params as RemoteLoadProductsParams).toQueryParameters,
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

    final future = sut.load(id, params);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.load(id, params);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return Products Users Bought if Load success', () async {
    final future = await sut.load(id, params);

    expect(productsMockValidEntity(), future.data);
  });
}
