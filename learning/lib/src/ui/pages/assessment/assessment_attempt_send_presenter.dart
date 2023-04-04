import 'package:design_system/design_system.dart';

abstract class AssessmentAttemptSendPresenter extends UpdatePresenter
    implements Listenable {
  Future<void> showLoading();
  Future<void> hideLoading();

  void handleError(Errors error, dynamic exception);
  Errors? get currentError;

  void init({
    required String assessmentId,
    required String attemptId,
    required String enrollmentId,
  });
  Future<void> load();

  int? get percentage;
  bool? get approved;
  bool? get canRetryAssessment;
}
