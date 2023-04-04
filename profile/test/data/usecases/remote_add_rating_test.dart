import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile/src/data/data.dart';
import 'package:profile/src/data/params/rating/rating.dart';
import 'package:profile/src/domain/domain.dart';

main() {
  late RemoteAddRating sut;
  late HttpClientSpy httpClient;
  late String url;

  late LoadAccountSpy loadAccount;
  late String token;
  late String refreshToken;

  late AddRatingParams params;

  setUp(() {
    params = AddRatingParams(
        kind: 'content',
        reference: faker.randomGenerator.string(10),
        score: faker.randomGenerator.integer(5),
        text: faker.randomGenerator.string(10));

    token = faker.guid.guid();
    refreshToken = faker.guid.guid();

    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();

    loadAccount = LoadAccountSpy();

    sut = RemoteAddRating(
      client: httpClient,
      loadAccount: loadAccount,
      url: url,
    );

    httpClient.mockRequest(() {});
    loadAccount.mockLoad(
        account: AccountEntity(token: token, refreshToken: refreshToken));
  });

  test('Should call Add with correct values', () async {
    await sut.add(params);

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.post.name,
        headers: getDefaultHeaders(token),
        body: RemoteAddRatingParams(params: params).toParams(),
      ),
    );
  });

  test('Should throw UnexpectedError if Add fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'NotFound',
      ),
    );

    final future = sut.add(params);
    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.add(params);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });
}
