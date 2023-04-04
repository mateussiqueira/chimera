import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/ui/pages/assessment/assessment.dart';

class NotifierAssessmentAttemptSendPresenter extends NotifierUpdatePresenter
    with LoadingMixin, HandleErrorMixin
    implements AssessmentAttemptSendPresenter {
  NotifierAssessmentAttemptSendPresenter({
    required this.remoteLoadEnrollmentUseCase,
  });

  final LoadEnrollmentUseCase remoteLoadEnrollmentUseCase;

  bool? _approved;
  bool? _canRetry;
  int? _percentage;
  String? _assessmentId;
  String? _attemptId;
  String? _enrollmentId;

  @override
  void init({
    required String assessmentId,
    required String attemptId,
    required String enrollmentId,
  }) {
    _assessmentId = assessmentId;
    _enrollmentId = enrollmentId;
    _attemptId = attemptId;
    load();
  }

  @override
  Future<void> load() async {
    showLoading();
    try {
      final enrollmentId = _enrollmentId;
      if (enrollmentId != null) {
        final enrollment = await remoteLoadEnrollmentUseCase.load(
          id: enrollmentId,
        );

        _updateAssessmentInfo(enrollment);
        Marcopolo().emit(UpdateCourseEvent());
        update();
      }
    } on NoInternetError catch (_) {
      handleError(Errors.noInternet, null);
    } on Exception catch (_) {
      handleError(Errors.generic, null);
    }
    hideLoading();
  }

  void _updateAssessmentInfo(EnrollmentEntity enrollment) {
    final assessmentId = _assessmentId;
    final attemptId = _attemptId;

    if (assessmentId != null && attemptId != null) {
      final assessment = enrollment.assessmentProgresses?.firstWhereOrNull(
        (progress) => progress.assessment?.id == assessmentId,
      );

      if (assessment != null) {
        final maxAttempts = assessment.assessment?.maxAttempts ?? 0;
        final attempts = assessment.attempts?.length ?? 0;
        final attempt = assessment.attempts?.firstWhereOrNull(
          (attempt) => attempt.id == attemptId,
        );

        if (attempt != null) {
          _canRetry = attempts < maxAttempts;
          _approved = attempt.status == AttemptsStatus.passed;
          _percentage = attempt.score;
        }
      }
    }
  }

  @override
  bool? get approved => _approved;

  @override
  bool? get canRetryAssessment => _canRetry;

  @override
  int? get percentage => _percentage;
}
