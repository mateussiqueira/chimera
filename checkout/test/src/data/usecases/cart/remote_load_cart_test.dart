import 'package:checkout/src/data/data.dart';
import 'package:checkout/src/domain/domain.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

main() {
  late RemoteLoadCart sut;
  late HttpClientSpy httpClient;
  late String url;

  late LoadAccountSpy loadAccount;
  late AccountEntity account;
  late String token;
  late String refreshToken;
  late CartEntity cartProducts;

  setUp(() {
    token = faker.guid.guid();
    refreshToken = faker.guid.guid();
    loadAccount = LoadAccountSpy();
    account = AccountEntity(token: token, refreshToken: refreshToken);
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();

    sut = RemoteLoadCart(
      loadAccount: loadAccount,
      client: httpClient,
      url: url,
    );

    cartProducts = RemoteCartModel.fromJson(mockCartLoadValidData).toEntity();

    loadAccount.mockLoad(account: account);
    httpClient.mockRequest(mockCartLoadValidData);
  });

  test('Should call Load with correct values', () async {
    await sut.load();

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(account.token),
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

  test('Should return Cart Products if Load success', () async {
    final future = await sut.load();

    expect(cartProducts, future);
  });
}
