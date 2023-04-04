import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/usecases/assessments/remote_update_attempt.dart';
import 'package:learning/src/domain/domain.dart';

main() {
  late RemoteUpdateAttempt sut;
  late HttpClientSpy httpClient;
  late String url;
  late String id;

  late LoadAccountSpy loadAccount;
  late AccountEntity account;
  late String token;
  late String refreshToken;

  late String questionId = faker.guid.guid();
  late String alternativeId = faker.guid.guid();

  late String questionId2 = faker.guid.guid();
  late String alternativeId2 = faker.guid.guid();

  List<UpdateAttemptParams> params = [
    UpdateAttemptParams(alternativeId: alternativeId, questionId: questionId),
    UpdateAttemptParams(alternativeId: alternativeId2, questionId: questionId2),
  ];

  setUp(() {
    id = faker.guid.guid();
    token = faker.guid.guid();
    refreshToken = faker.guid.guid();
    loadAccount = LoadAccountSpy();
    account = AccountEntity(token: token, refreshToken: refreshToken);
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();

    sut = RemoteUpdateAttempt(
      loadAccount: loadAccount,
      client: httpClient,
      url: url,
    );

    loadAccount.mockLoad(account: account);
    httpClient.mockRequest({});
  });

  test('Should call Update with correct values', () async {
    await sut.update(params: params, attemptId: id);

    final endpoint = '$url/$id';

    verify(
      () => httpClient.request(
          url: endpoint,
          method: HttpMethod.patch.name,
          headers: getDefaultHeaders(account.token),
          body: {
            "answers": params
                .map((e) => {
                      "question_id": e.questionId,
                      "alternative_id": e.alternativeId
                    })
                .toList()
          }),
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

    final future = sut.update(params: params, attemptId: id);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.update(params: params, attemptId: id);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return void if Update success', () async {
    await sut.update(params: params, attemptId: id);
  });
}
