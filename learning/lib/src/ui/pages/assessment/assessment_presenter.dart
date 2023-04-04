import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/ui/pages/assessment/widgets/question_navigation_presenter_mixin.dart';

import 'alternative_enum.dart';

abstract class AssessmentPresenter extends UpdatePresenter
    with QuestionNavigationPresenterMixin
    implements Listenable {
  Future<void> showLoading();
  Future<void> hideLoading();

  void handleError(Errors error, dynamic exception);
  Errors? get currentError;

  void init({AssessmentPageArgumentsEntity? arguments});
  int maxAttempts();
  int attemptNumber();
  String getCurrentStatement();
  int getCurrentAlternativesLenght();
  String getCurrentAlternativeLetter(int alternativeIndex);
  String getCurentAlternativeStatement(int alternativeIndex);
  AlternativeEnum getCurrentAlternativeStatus(int alternativeIndex);
  void selectAlternative(int alternativeIndex);
  int startSecondsRemaining();
  String pageTitle();
  bool isVisualizationOnly();
  bool? questionHit();
  bool shouldShowCommentedFeedback();
  String commentedFeedback();
  Future<bool> updateAnswers({required bool showToast});
  bool shouldSend();
  Future<void> visualizeAttemptSent();
  String? get assessmentId;
  String? get enrollmentId;
  String? get attemptId;
}
