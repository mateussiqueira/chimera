import 'dart:async';

import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/assessment/assessment_presenter.dart';

import '../../data/data.dart';
import '../../domain/domain.dart';
import '../../ui/pages/assessment/alternative_enum.dart';
import '../../ui/pages/assessment/widgets/alternative_widget.dart';
import '../presentation.dart';

class NotifierAssessmentPresenter extends NotifierUpdatePresenter
    with NotifierQuestionNavigationMixin, LoadingMixin, HandleErrorMixin
    implements AssessmentPresenter {
  NotifierAssessmentPresenter({
    required this.completeAttempt,
    required this.loadAttempt,
    required this.updateAttempt,
  }) {
    questionNavigationMixinListenable = this;
  }

  final LoadAttempt loadAttempt;
  final CompleteAttempt completeAttempt;
  final UpdateAttempt updateAttempt;

  AssessmentAttemptEntity? _assessmentAttempt;
  int _attemptNumber = 0;
  int _maxAttempts = 0;
  String _pageTitle = R.string.assessment;
  bool _visualizeOnly = true;
  int _totalAssessmentTimeInSeconds = 0;
  int _remainingSeconds = 0;
  String? _enrollmentId;

  Timer? _countdownTimer;

  @override
  void update() {
    notifyListeners();
  }

  @override
  void init({AssessmentPageArgumentsEntity? arguments}) {
    _attemptNumber = arguments?.attemptNumber ?? 0;
    _maxAttempts = arguments?.maxAttempts ?? 0;
    _pageTitle = arguments?.contentTitle ?? R.string.assessment;
    _visualizeOnly = arguments?.visualizeOnly ?? true;
    _assessmentAttempt = arguments?.assessmentAttempt;
    _totalAssessmentTimeInSeconds = arguments?.timeInSeconds ?? 0;
    _remainingSeconds = _totalAssessmentTimeInSeconds;
    initNavigationParams(0, _getTotalQuestions());
    _enrollmentId = arguments?.enrollmentId;

    if (!_visualizeOnly) {
      _startTimer();
    }
  }

  int _getTotalQuestions() {
    return _assessmentAttempt?.questions?.length ?? 0;
  }

  QuestionEntity? getCurrentQuestion() {
    return _assessmentAttempt?.questions?.getOrNull(currentIndex());
  }

  @override
  String getCurrentStatement() {
    return getCurrentQuestion()?.statement ?? '';
  }

  List<AlternativeEntity>? _getCurrentAlternatives() {
    return getCurrentQuestion()?.alternatives;
  }

  @override
  int getCurrentAlternativesLenght() {
    return _getCurrentAlternatives()?.length ?? 0;
  }

  @override
  String getCurrentAlternativeLetter(int alternativeIndex) {
    return AlternativeWidget.alternativesLetters[alternativeIndex];
  }

  @override
  String getCurentAlternativeStatement(int alternativeIndex) {
    return _getCurrentAlternatives()?.getOrNull(alternativeIndex)?.statement ??
        '';
  }

  @override
  AlternativeEnum getCurrentAlternativeStatus(int alternativeIndex) {
    int? selectedAlternativeIndex = currentSelectedAlternative();
    if (selectedAlternativeIndex == alternativeIndex) {
      if (_visualizeOnly) {
        return questionHit() == true
            ? AlternativeEnum.correct
            : AlternativeEnum.wrong;
      }
      return AlternativeEnum.selected;
    }
    return AlternativeEnum.notSelected;
  }

  int? getAlternativeIndexById(String? alternativeId) {
    if (alternativeId != null &&
        getCurrentQuestion()?.alternatives?.isNotEmpty == true) {
      for (int index = 0;
          index < getCurrentQuestion()!.alternatives!.length;
          index++) {
        if (getCurrentQuestion()?.alternatives?.getOrNull(index)?.id ==
            alternativeId) {
          return index;
        }
      }
    }
    return null;
  }

  int? currentSelectedAlternative() {
    String? alternativeId = _assessmentAttempt?.answers
        ?.firstWhereOrNull(
          (e) => e.questionId == getCurrentQuestion()?.id,
        )
        ?.alternativeId;
    return getAlternativeIndexById(alternativeId);
  }

  @override
  void selectAlternative(int alternativeIndex) {
    if (_visualizeOnly) return;
    String? questionId = getCurrentQuestion()?.id;
    if (questionId == null) return;
    String? alternativeId =
        getCurrentQuestion()?.alternatives?.getOrNull(alternativeIndex)?.id;
    List<AnswerEntity>? result;
    if (currentSelectedAlternative() != null) {
      result = _assessmentAttempt?.answers?.map((e) {
        if (e.questionId == questionId) {
          return AnswerEntity(
            alternativeId:
                e.alternativeId == alternativeId ? null : alternativeId,
            questionId: questionId,
          );
        }
        return e;
      }).toList();
    } else {
      result = (_assessmentAttempt?.answers ?? []) +
          [
            AnswerEntity(
              alternativeId: alternativeId,
              questionId: questionId,
            )
          ];
    }
    result = result
        ?.where((e) => e.alternativeId != null && e.questionId != null)
        .toSet()
        .toList();
    _assessmentAttempt = _assessmentAttempt?.copyWith(result);
    update();
  }

  @override
  bool isVisualizationOnly() {
    return _visualizeOnly;
  }

  @override
  int maxAttempts() {
    return _maxAttempts;
  }

  @override
  int attemptNumber() {
    return _attemptNumber;
  }

  @override
  bool? questionHit() {
    AssessmentAnswerStatus? status = getCurrentQuestion()?.status;
    if (status != null) {
      switch (status) {
        case AssessmentAnswerStatus.correct:
          return true;
        case AssessmentAnswerStatus.wrong:
        case AssessmentAnswerStatus.pending:
        case AssessmentAnswerStatus.blank:
          return false;
        default:
          return null;
      }
    }
    return null;
  }

  @override
  int startSecondsRemaining() {
    return _remainingSeconds;
  }

  @override
  String pageTitle() {
    return _pageTitle;
  }

  @override
  bool shouldShowCommentedFeedback() {
    return _visualizeOnly && getCurrentQuestion()?.feedback?.isNotEmpty == true;
  }

  @override
  String commentedFeedback() {
    return getCurrentQuestion()?.feedback ?? '';
  }

  @override
  bool showForwardButton() => !showSendButton();

  @override
  bool showSendButton() {
    return !canGoForward() && _getTotalQuestions() > 0 && !_visualizeOnly;
  }

  @override
  bool shouldSend() {
    int lengthQuestions = _assessmentAttempt?.questions?.length ?? 0;
    int lengthAnswers = _assessmentAttempt?.answers?.length ?? 0;
    return lengthQuestions > 0 && lengthQuestions == lengthAnswers;
  }

  @override
  void setCurrentIndex(int index) {
    if (currentSelectedAlternative() != null) {
      updateAnswers(showToast: false);
    }
    super.setCurrentIndex(index);
  }

  @override
  Future<bool> updateAnswers({required bool showToast}) async {
    bool success = false;
    try {
      await updateAttempt.update(
        params: RemoteUpdateAttemptParams.fromAnswers(
          _assessmentAttempt?.answers,
        ),
        attemptId: _assessmentAttempt?.id ?? '',
      );
      success = true;
    } on NoInternetError catch (_) {
      if (showToast) {
        ToastWidget.showNoInternet();
      }
    } catch (_) {
      if (showToast) {
        ToastWidget.showGenericError();
      }
    }
    return success;
  }

  @override
  Future<bool> send() async {
    bool success = false;
    try {
      showLoading();
      var result = await updateAnswers(showToast: true);
      if (result) {
        await completeAttempt.complete(attemptId: _assessmentAttempt?.id ?? '');
        success = true;
      }
    } on NoInternetError catch (_) {
      handleError(Errors.noInternet, null);
    } on Exception catch (_) {
      handleError(Errors.generic, null);
    }
    hideLoading();
    return success;
  }

  @override
  Future<void> visualizeAttemptSent() async {
    try {
      showLoading();
      _assessmentAttempt =
          await loadAttempt.load(id: _assessmentAttempt?.id ?? '');
      _visualizeOnly = true;
      super.setCurrentIndex(0);
    } on NoInternetError catch (_) {
      handleError(Errors.noInternet, null);
    } on Exception catch (_) {
      handleError(Errors.generic, null);
    }
    hideLoading();
    LoadingWidget.hide();
  }

  @override
  bool isAnsweredIndex(int index) {
    final question = _assessmentAttempt?.questions?.getOrNull(index);
    if (question != null) {
      final answer = _assessmentAttempt?.answers?.firstWhereOrNull(
        (e) => e.questionId == question.id,
      );
      return answer?.alternativeId != null;
    }
    return false;
  }

  @override
  bool isAnsweredAfterIndex(int index) {
    final questionIds = getQuestionsByIndex(true, index);

    return anyAnsweredQuestion(questionIds);
  }

  @override
  bool isAnsweredBeforeIndex(int index) {
    final questionIds = getQuestionsByIndex(false, index - 1);

    return anyAnsweredQuestion(questionIds);
  }

  bool anyAnsweredQuestion(List<String> questionIds) {
    final anyAnsweredQuestion = _assessmentAttempt?.answers?.any((answer) {
      final haveAnswer = answer.alternativeId != null;
      final isAnyDesiredQuestionId = questionIds.contains(answer.questionId);
      return haveAnswer && isAnyDesiredQuestionId;
    });

    return anyAnsweredQuestion ?? false;
  }

  List<String> getQuestionsByIndex(bool after, int index) {
    final questionIds = <String>[];
    final questions = _assessmentAttempt?.questions;
    if (questions != null) {
      for (int i = index;
          after ? i < questions.length : i >= 0;
          after ? i++ : i--) {
        final question = questions.getOrNull(i);
        final questionId = question?.id;
        if (question != null && questionId != null) {
          questionIds.add(questionId);
        }
      }
    }

    return questionIds;
  }

  @override
  String? get assessmentId => _assessmentAttempt?.assessmentId;

  @override
  String? get attemptId => _assessmentAttempt?.id;

  @override
  String? get enrollmentId => _enrollmentId;

  void _startTimer() {
    _disposeCountDown();
    _countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => _setCountDown());
  }

  void _setCountDown() {
    _remainingSeconds--;
    if (_remainingSeconds <= 0) {
      _disposeCountDown();
    }
    update();
  }

  void _disposeCountDown() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
  }

  @override
  void dispose() {
    _disposeCountDown();
    super.dispose();
  }
}
