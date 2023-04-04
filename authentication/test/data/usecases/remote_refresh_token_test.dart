import 'package:authentication/src/data/data.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

main() {
  late RemoteRefreshToken sut;
  late HttpClientSpy httpClient;
  late LoadAccountSpy loadAccount;
  late InitUserSpy initUser;
  late String url;

  late String token;
  late String refreshToken;

  token = faker.guid.guid();
  refreshToken = faker.guid.guid();

  final account = AccountEntity(
    token: token,
    refreshToken: refreshToken,
  );

  Map<String, dynamic> mockValidData() => {
        "token": token,
        "refresh_token": refreshToken,
      };

  setUpAll(() {
    registerFallbackValue(const AccountEntity(
      token: 'token',
      refreshToken: 'refreshToken',
    ));
  });

  setUp(() {
    httpClient = HttpClientSpy();
    initUser = InitUserSpy();
    loadAccount = LoadAccountSpy();

    url = faker.internet.httpUrl();
    sut = RemoteRefreshToken(
      httpClient: httpClient,
      url: url,
      initUser: initUser,
      localLoadAccount: loadAccount,
    );

    initUser.mockInitUser();
    loadAccount.mockLoad(account: account);
    httpClient.mockRequest(mockValidData());
  });

  test('Should call Refresh with correct values', () async {
    await sut.refresh();

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.post.name,
        body: {
          "token": refreshToken,
        },
      ),
    );
  });

  test('Should Refresh save new token', () async {
    await sut.refresh();

    verify(
      () => initUser.initUser(
        account: any(named: 'account'),
      ),
    );
  });

  test('Should throw BusinessError if Refresh Token fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'refresh token expired',
      ),
    );

    final future = sut.refresh();

    expect(future, throwsA(const TypeMatcher<BusinessError>()));
  });

  test('Should return an Account if Refresh Token success', () async {
    final validData = mockValidData();
    final validEntity = RemoteAccountModel.fromJson(validData).toEntity();
    httpClient.mockRequest(validData);
    final account = await sut.refresh();

    expect(account, validEntity.token);
  });
}
