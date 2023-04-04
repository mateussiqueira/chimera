import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/usecases/assessments/assessments.dart';
import 'package:courses/courses.dart';

main() {
  late RemoteCompleteAttempt sut;
  late HttpClientSpy httpClient;
  late String url;

  late LoadAccountSpy loadAccount;
  late AccountEntity account;
  late String token;
  late String refreshToken;

  late String id = faker.guid.guid();
  AssessmentAttemptEntity assessmentAttempt = AssessmentAttemptEntity(
    id: faker.guid.guid(),
    assessmentId: faker.guid.guid(),
    status: AttemptsStatus.completed,
    score: faker.randomGenerator.integer(100),
    expiresAt: DateTime.now(),
    questions: [
      QuestionEntity(
          id: faker.guid.guid(),
          feedback: faker.guid.guid(),
          alternativeId: faker.guid.guid(),
          statement: faker.guid.guid(),
          status: AssessmentAnswerStatus.correct,
          alternatives: [
            AlternativeEntity(
                id: faker.guid.guid(), statement: faker.guid.guid())
          ])
    ],
    answers: [
      AnswerEntity(
          questionId: faker.guid.guid(), alternativeId: faker.guid.guid())
    ],
  );

  Map mockValidData() => RemoteAssessmentAttemptModel.toMap(assessmentAttempt);

  setUp(() {
    token = faker.guid.guid();
    refreshToken = faker.guid.guid();
    loadAccount = LoadAccountSpy();
    account = AccountEntity(token: token, refreshToken: refreshToken);
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();

    sut = RemoteCompleteAttempt(
      loadAccount: loadAccount,
      client: httpClient,
      url: url,
    );

    loadAccount.mockLoad(account: account);
    httpClient.mockRequest(mockValidData());
  });

  test('Should call Complete with correct values', () async {
    await sut.complete(attemptId: id);

    final endpoint = '$url/$id/complete';

    verify(
      () => httpClient.request(
        url: endpoint,
        method: HttpMethod.post.name,
        headers: getDefaultHeaders(account.token),
      ),
    );
  });

  test('Should throw UnexpectedError if Complete fail', () async {
    httpClient.mockRequestError(
      BusinessError(
        statusCode: 422,
        code: 'XX',
        message: 'NotFound',
      ),
    );

    final future = sut.complete(attemptId: id);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.complete(attemptId: id);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return Assessment Attempt if Complete success', () async {
    final future = await sut.complete(attemptId: id);

    expect(assessmentAttempt, future);
  });
}
