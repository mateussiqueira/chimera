import 'package:dependencies/dependencies.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/presentation/presentation.dart';
import 'package:learning/src/ui/pages/pages.dart';

import 'data/usecases/usecases.dart';
import 'domain/usecases/usecases.dart';

class LearningModule {
  static final alligator = Alligator();

  static Alligator initialize() {
    alligator.register<LoadEnrollmentsUseCase>(
      () => RemoteLoadEnrollmentsUseCase(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url('/courses/enrollments/'),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<LoadEnrollmentUseCase>(
      () => RemoteLoadEnrollmentUseCase(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url('/courses/enrollments/{ENROLLMENT_ID}'),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<LoadContentUseCase>(
      () => RemoteLoadContentUseCase(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(
          '/courses/enrollments/{ENROLLMENT_ID}/contents/{CONTENT_ID}',
        ),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<SaveEnrollmentProgress>(
      () => RemoteSaveEnrollmentProgress(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(
          '/courses/enrollments/{ENROLLMENT_ID}/progress',
        ),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<RemoveEnrollmentProgress>(
      () => RemoteRemoveEnrollmentProgress(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(
          '/courses/enrollments/{ENROLLMENT_ID}/progress',
        ),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<LoadEnrollmentRatings>(
      () => RemoteLoadEnrollmentRatings(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(
          '/ratings',
        ),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<SaveEnrollmentRating>(
      () => RemoteSaveEnrollmentRating(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(
          '/ratings',
        ),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<MyEnrollmentsPresenter>(
      () => NotifierMyEnrollmentsPresenter(
        remoteLoadEnrollments: alligator.get<LoadEnrollmentsUseCase>(),
        localUserIsLoggedIn: alligator.get<UserIsLoggedIn>(),
        networkConnection: alligator.get<NetworkConnection>(),
      ),
    );

    alligator.register<CoursePresenter>(
      () => NotifierCoursePresenter(
        remoteLoadEnrollment: alligator.get<LoadEnrollmentUseCase>(),
        loadEnrollmentRatings: alligator.get<LoadEnrollmentRatings>(),
        saveEnrollmentRating: alligator.get<SaveEnrollmentRating>(),
        remoteLoadContent: alligator.get<LoadContentUseCase>(),
        removeEnrollmentProgress: alligator.get<RemoveEnrollmentProgress>(),
        saveEnrollmentProgress: alligator.get<SaveEnrollmentProgress>(),
      ),
    );

    alligator.register<ContentPresenter>(
      () => NotifierContentPresenter(
        remoteLoadContent: alligator.get<LoadContentUseCase>(),
        removeEnrollmentProgress: alligator.get<RemoveEnrollmentProgress>(),
        saveEnrollmentProgress: alligator.get<SaveEnrollmentProgress>(),
      ),
    );

    alligator.register<LoadAttempt>(
      () => RemoteLoadAttempt(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(
          '/assessments/attempts',
        ),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<AddAttempt>(
      () => RemoteAddAttempt(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(
          '/assessments/attempts',
        ),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<AttemptsPresenter>(
      () => NotifierAttemptsPresenter(
        loadAttempt: alligator.get<LoadAttempt>(),
        addAttempt: alligator.get<AddAttempt>(),
      ),
    );

    alligator.register<UpdateAttempt>(
      () => RemoteUpdateAttempt(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(
          '/assessments/attempts/{id}',
        ),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<CompleteAttempt>(
      () => RemoteCompleteAttempt(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(
          '/assessments/attempts/{id}/complete',
        ),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<AssessmentPresenter>(
      () => NotifierAssessmentPresenter(
        completeAttempt: alligator.get<CompleteAttempt>(),
        loadAttempt: alligator.get<LoadAttempt>(),
        updateAttempt: alligator.get<UpdateAttempt>(),
      ),
    );

    alligator.register<AssessmentAttemptSendPresenter>(
      () => NotifierAssessmentAttemptSendPresenter(
        remoteLoadEnrollmentUseCase: alligator.get<LoadEnrollmentUseCase>(),
      ),
    );

    return alligator;
  }
}
