import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/data.dart';

import '../../../mocks/mocks.dart';

main() {
  late RemoteLoadContentUseCase sut;
  late HttpClientSpy httpClient;
  late String url;
  late LoadAccountSpy loadAccount;
  late String enrollmentId;
  late String contentId;
  late List<String> completedContentList;

  setUp(() {
    httpClient = HttpClientSpy();
    loadAccount = LoadAccountSpy();
    url = faker.internet.httpUrl();
    enrollmentId = faker.guid.guid();
    contentId = faker.guid.guid();
    completedContentList = [];

    sut = RemoteLoadContentUseCase(
      loadAccount: loadAccount,
      client: httpClient,
      url: url,
    );

    loadAccount.mockLoad();

    httpClient.mockRequest(mockContentValidData);
  });

  test('Should call Load with correct values', () async {
    await sut.load(enrollmentId: enrollmentId, contentId: contentId);

    verify(
      () => httpClient.request(
        url: url,
        method: HttpMethod.get.name,
        headers: getDefaultHeaders(loadAccount.accountEntityMock.token),
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

    final future = sut.load(enrollmentId: enrollmentId, contentId: contentId);

    expect(future, throwsA(const TypeMatcher<UnexpectedError>()));
  });

  test('Should throw NoInternetError if user do not have internet', () async {
    httpClient.mockRequestError(NoInternetError());

    final future = sut.load(enrollmentId: enrollmentId, contentId: contentId);

    expect(future, throwsA(const TypeMatcher<NoInternetError>()));
  });

  test('Should return Contents if Load success', () async {
    final contents = await sut.load(
      enrollmentId: enrollmentId,
      contentId: contentId,
    );

    expect(
      contents,
      RemoteContentModel.fromJson(mockContentValidData, completedContentList),
    );
  });
}
