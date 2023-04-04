import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/usecases/assessments/assessments.dart';
import 'package:courses/courses.dart';

main() {
  late RemoteLoadAttempt sut;
  late HttpClientSpy httpClient;
  late String url;

  late LoadAccountSpy loadAccount;
  late AccountEntity account;
  late String token;
  late String refreshToken;

  late AssessmentAttemptEntity attempt;

  String id = faker.guid.guid();
  String assessmentId = faker.guid.guid();
  AttemptsStatus status = AttemptsStatus.completed;
  DateTime expiresAt = DateTime.now();

  Map<String, dynamic> mockValidData() => {
        "id": id,
        "assessment_id": assessmentId,
        "status": status.name,
        "expires_at": expiresAt.toIso8601String(),
      };

  setUp(() {
    token = faker.guid.guid();
    refreshToken = faker.guid.guid();
    loadAccount = LoadAccountSpy();
    account = AccountEntity(token: token, refreshToken: refreshToken);
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();

    sut = RemoteLoadAttempt(
      loadAccount: loadAccount,
      client: httpClient,
      url: url,
    );

    attempt = RemoteAssessmentAttemptModel(json: mockValidData()).toEntity();
    loadAccount.mockLoad(account: account);
    httpClient.mockRequest(mockValidData());
  });

  test('Should call Load with correct values', () async {
    await sut.load(id: id);

    final endpoint = '$url/$id';

    verify(
      () => httpClient.request(
        url: endpoint,
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

    final future = sut.load(id: id);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.load(id: id);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return Attempt if Load success', () async {
    final future = await sut.load(id: id);

    expect(attempt, future);
  });
}
