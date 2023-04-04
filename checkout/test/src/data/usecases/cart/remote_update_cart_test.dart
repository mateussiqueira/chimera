import 'package:checkout/src/data/data.dart';
import 'package:checkout/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

main() {
  late RemoteUpdateCart sut;
  late HttpClientSpy httpClient;
  late String url;

  late LoadAccountSpy loadAccount;
  late AccountEntity account;

  late String token;
  late String refreshToken;

  late String id;
  late CartEntity cartProductsLoad;
  late CartEntity cartProductsUpdate;

  setUp(() {
    id = faker.guid.guid();
    token = faker.guid.guid();
    refreshToken = faker.guid.guid();
    loadAccount = LoadAccountSpy();
    account = AccountEntity(token: token, refreshToken: refreshToken);
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();

    sut = RemoteUpdateCart(
      loadAccount: loadAccount,
      client: httpClient,
      url: url,
    );

    cartProductsLoad =
        RemoteCartModel.fromJson(mockCartLoadValidData).toEntity();
    cartProductsUpdate =
        RemoteCartModel.fromJson(mockCartUpdateValidData).toEntity();

    loadAccount.mockLoad(account: account);
    httpClient.mockRequest(mockCartLoadValidData);
  });

  test('Should call Update with correct values', () async {
    await sut.update(offerIds: [id]);

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.put.name,
        headers: getDefaultHeaders(account.token),
        body: {
          "offers": [
            {
              "id": id,
            }
          ]
        },
      ),
    );
  });

  test('Should throw UnexpectedError if Update fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'NotFound',
      ),
    );

    final future = sut.update(offerIds: [id]);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.update(offerIds: [id]);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return Cart Products if Update success', () async {
    final future = await sut.update(offerIds: [id]);

    expect(cartProductsLoad, future);
  });

  test('Should return Empty List of Cart Products if Update success', () async {
    dynamic future = await sut.update(offerIds: [id]);

    expect(cartProductsLoad, future);

    httpClient.mockRequest(mockCartUpdateValidData);
    future = await sut.update(offerIds: [id]);

    expect(cartProductsUpdate, future);
  });
}
