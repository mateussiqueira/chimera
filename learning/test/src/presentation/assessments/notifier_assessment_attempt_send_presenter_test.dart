import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/presentation/presentation.dart';

import '../../mocks/mocks.dart';

void main() {
  late LoadEnrollmentSpy loadEnrollment;
  late NotifierAssessmentAttemptSendPresenter sut;

  setUp(() {
    loadEnrollment = LoadEnrollmentSpy();
    sut = NotifierAssessmentAttemptSendPresenter(
      remoteLoadEnrollmentUseCase: loadEnrollment,
    );

    loadEnrollment.mockLoad();
  });
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(const RemoteLoadEnrollmentsParams());
  });

  test('Should emits error events on GenericError', () async {
    loadEnrollment.mockLoadError(Exception());

    sut.init(
        assessmentId: faker.guid.guid(),
        attemptId: faker.guid.guid(),
        enrollmentId: faker.guid.guid());

    await sut.load();
    expect(sut.currentError, Errors.generic);
  });
  test('Should emits error events on NoInternet', () async {
    loadEnrollment.mockLoadError(NoInternetError());

    sut.init(
        assessmentId: faker.guid.guid(),
        attemptId: faker.guid.guid(),
        enrollmentId: faker.guid.guid());

    await sut.load();
    expect(sut.currentError, Errors.noInternet);
  });
}
