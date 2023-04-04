import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';

import '../../ui/pages/pages.dart';

class NotifierAttemptsPresenter extends ChangeNotifier
    with LoadingMixin, HandleErrorMixin
    implements AttemptsPresenter {
  NotifierAttemptsPresenter({
    required this.loadAttempt,
    required this.addAttempt,
  });

  EnrollmentEntity? _enrollment;
  ContentEntity? _selectedContent;
  LoadAttempt loadAttempt;
  AddAttempt addAttempt;

  void _update() {
    notifyListeners();
  }

  @override
  void init(EnrollmentEntity? enrollment, ContentEntity? content) {
    _enrollment = enrollment;
    _selectedContent = content;
    _update();
  }

  List<AssessmentProgressEntity>? get _progresses =>
      _enrollment?.assessmentProgresses;

  AssessmentEntity? _getAssessment() =>
      LocalAssessmentHelperModel.getAssessment(
        _progresses,
        _selectedContent,
      );

  List<AssessmentAttemptEntity>? _getAttemptsList() =>
      LocalAssessmentHelperModel.getAttemptsList(
        _progresses,
        _selectedContent,
      );

  AssessmentAttemptEntity? _getAttempt(int index) =>
      _getAttemptsList()?.getOrNull(index);

  @override
  int attemptsCreatedLength() {
    return _getAttemptsList()?.length ?? 0;
  }

  @override
  int newAttemptNumber() {
    return attemptsCreatedLength() + 1;
  }

  @override
  int maxAttempts() {
    return _getAssessment()?.maxAttempts ?? 0;
  }

  @override
  int timeInSeconds() =>
      LocalAssessmentHelperModel.timeInSeconds(_progresses, _selectedContent) ??
      0;

  @override
  int timeInMinutes() =>
      LocalAssessmentHelperModel.timeInMinutes(_progresses, _selectedContent);

  @override
  bool achieveAttemptsLimit() {
    return attemptsCreatedLength() >= maxAttempts();
  }

  @override
  bool couldCreateNewAttempt() {
    return attemptsCreatedLength() < maxAttempts() && !hasPendingAttempt();
  }

  @override
  bool hasPendingAttempt() {
    if (_getAttemptsList()?.isNotEmpty == true) {
      for (int index = 0; index < attemptsCreatedLength(); index++) {
        if (isAttemptPending(index)) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  bool isAttemptPending(int index) {
    return _getAttempt(index)?.status == AttemptsStatus.pending;
  }

  @override
  String? contentTitle() {
    return _selectedContent?.name;
  }

  @override
  EnrollmentEntity? get enrollment => _enrollment;

  @override
  Future<AssessmentAttemptEntity?> createAttempt() async {
    AssessmentAttemptEntity? result;
    try {
      showLoading();
      result = await addAttempt.add(
        params: AddAttemptParams(id: _getAssessment()?.id ?? ''),
      );
    } on NoInternetError catch (_) {
      handleError(Errors.noInternet, null);
    } catch (_) {
      handleError(Errors.generic, null);
    }
    hideLoading();
    return result;
  }

  @override
  Future<AssessmentAttemptEntity?> visualizeAttempt(int index) async {
    AssessmentAttemptEntity? result;
    try {
      showLoading();
      result = await loadAttempt.load(id: _getAttempt(index)?.id ?? '');
    } on NoInternetError catch (_) {
      handleError(Errors.noInternet, null);
    } catch (_) {
      handleError(Errors.generic, null);
    }
    hideLoading();
    return result;
  }
}
