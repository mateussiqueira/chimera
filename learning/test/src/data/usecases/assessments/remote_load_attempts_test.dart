import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/usecases/assessments/assessments.dart';
import 'package:courses/courses.dart';

main() {
  late RemoteLoadAttempts sut;
  late HttpClientSpy httpClient;
  late String url;

  late LoadAccountSpy loadAccount;
  late AccountEntity account;
  late String token;
  late String refreshToken;

  late List<AssessmentAttemptEntity>? attempts;

  String id = faker.guid.guid();
  String assessmentId = faker.guid.guid();
  AttemptsStatus status = AttemptsStatus.completed;
  DateTime expiresAt = DateTime.now();

  String id2 = faker.guid.guid();
  String assessmentId2 = faker.guid.guid();
  AttemptsStatus status2 = AttemptsStatus.passed;
  DateTime expiresAt2 = DateTime.now();

  List<Map<String, dynamic>> mockValidData() => [
        {
          "id": id,
          "assessment_id": assessmentId,
          "status": status.name,
          "expires_at": expiresAt.toIso8601String(),
        },
        {
          "id": id2,
          "assessment_id": assessmentId2,
          "status": status2.name,
          "expires_at": expiresAt2.toIso8601String(),
        },
      ];

  setUp(() {
    token = faker.guid.guid();
    refreshToken = faker.guid.guid();
    loadAccount = LoadAccountSpy();
    account = AccountEntity(token: token, refreshToken: refreshToken);
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();

    sut = RemoteLoadAttempts(
      loadAccount: loadAccount,
      client: httpClient,
      url: url,
    );

    attempts = RemoteAssessmentAttemptModel.toEntityList(mockValidData()) ?? [];
    loadAccount.mockLoad(account: account);
    httpClient.mockRequest(mockValidData());
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

  test('Should return Attempts if Load success', () async {
    final future = await sut.load();

    expect(attempts, future);
  });
}
