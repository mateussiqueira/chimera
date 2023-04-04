import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/presentation/presentation.dart';

import '../../mocks/mocks.dart';

void main() {
  late NotifierCoursePresenter sut;
  late LoadEnrollmentSpy remoteLoadEnrollment;
  late LoadEnrollmentRatingsSpy loadEnrollmentRatings;
  late SaveEnrollmentRatingSpy saveEnrollmentRating;
  late LoadContentUseCaseSpy remoteLoadContent;
  late SaveEnrollmentProgressSpy saveEnrollmentProgress;
  late RemoveEnrollmentProgressSpy removeEnrollmentProgress;

  late EnrollmentEntity enrollment;
  late ContentEntity content;

  setUp(() {
    remoteLoadEnrollment = LoadEnrollmentSpy();
    loadEnrollmentRatings = LoadEnrollmentRatingsSpy();
    saveEnrollmentRating = SaveEnrollmentRatingSpy();
    remoteLoadContent = LoadContentUseCaseSpy();
    saveEnrollmentProgress = SaveEnrollmentProgressSpy();
    removeEnrollmentProgress = RemoveEnrollmentProgressSpy();

    sut = NotifierCoursePresenter(
      remoteLoadEnrollment: remoteLoadEnrollment,
      loadEnrollmentRatings: loadEnrollmentRatings,
      saveEnrollmentRating: saveEnrollmentRating,
      remoteLoadContent: remoteLoadContent,
      saveEnrollmentProgress: saveEnrollmentProgress,
      removeEnrollmentProgress: removeEnrollmentProgress,
    );

    enrollment = const EnrollmentEntity(course: CourseEntity());
    content = ContentEntity(
      coreId: faker.guid.guid(),
      coreKind: ContentKind.video,
      id: faker.guid.guid(),
      name: faker.person.name(),
      url: faker.internet.httpsUrl(),
    );

    remoteLoadEnrollment.mockLoad();
    loadEnrollmentRatings.mockLoad(const [
      RemoteRatingModel(),
      RemoteRatingModel(),
    ]);
    saveEnrollmentRating.mockSave();
    remoteLoadContent.mockLoad(content);
    saveEnrollmentProgress.mockSave();
    removeEnrollmentProgress.mockRemove();
  });
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(const RemoteRatingModel());
  });

  test('Should call Load with correct values', () {
    sut.load(enrollment);
  });
}
