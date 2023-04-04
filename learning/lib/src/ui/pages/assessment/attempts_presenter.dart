import 'package:courses/courses.dart';
import 'package:design_system/design_system.dart';

import '../../../domain/domain.dart';

abstract class AttemptsPresenter implements Listenable {
  Future<void> showLoading();
  Future<void> hideLoading();

  void handleError(Errors error, dynamic exception);
  Errors? get currentError;
  void init(EnrollmentEntity? enrollment, ContentEntity? content);
  int attemptsCreatedLength();
  int newAttemptNumber();
  int maxAttempts();
  int timeInSeconds();
  int timeInMinutes();
  bool achieveAttemptsLimit();
  bool couldCreateNewAttempt();
  bool isAttemptPending(int index);
  bool hasPendingAttempt();
  EnrollmentEntity? get enrollment;
  String? contentTitle();
  Future<AssessmentAttemptEntity?> createAttempt();
  Future<AssessmentAttemptEntity?> visualizeAttempt(int index);
}
