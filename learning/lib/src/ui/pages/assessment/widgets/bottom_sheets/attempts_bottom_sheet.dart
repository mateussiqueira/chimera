import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../../../domain/domain.dart';
import '../../attempts_presenter.dart';

class AttemptsBottomSheet extends StatelessWidget {
  AttemptsBottomSheet({
    Key? key,
    required this.presenter,
    required EnrollmentEntity? enrollment,
    required ContentEntity? content,
  }) : super(key: key) {
    presenter.init(enrollment, content);
  }

  final AttemptsPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBaseWidget(
      iconWaveWidget: IconWaveWidget(
        icon: Icons.alertCircle,
        iconWaveType: iconType(),
      ),
      title: _getTitle(),
      subtitle: _getSubtitle(),
      body: body(context),
    );
  }

  Future<void> visualizeAttempt(
      {required int index,
      required bool visualizeOnly,
      required BuildContext context}) async {
    var result = await presenter.visualizeAttempt(index);
    if (result != null) {
      navigateToAssessment(
        attemptNumber: index + 1,
        context: context,
        attempt: result,
        visualizeOnly: visualizeOnly,
      );
    }
  }

  void navigateToAssessment({
    required BuildContext context,
    required AssessmentAttemptEntity attempt,
    required int attemptNumber,
    required visualizeOnly,
  }) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(
      '/learning/assessment',
      arguments: {
        'arguments': AssessmentPageArgumentsEntity(
          assessmentAttempt: attempt,
          attemptNumber: attemptNumber,
          contentTitle: presenter.contentTitle(),
          maxAttempts: presenter.maxAttempts(),
          timeInSeconds: presenter.timeInSeconds(),
          visualizeOnly: visualizeOnly,
          enrollmentId: presenter.enrollment?.id ?? '',
        )
      },
    );
  }

  bool achieveAttemptsLimitAndHasNoPendingAttempts() {
    return presenter.achieveAttemptsLimit() && !presenter.hasPendingAttempt();
  }

  String _getTitle() {
    return achieveAttemptsLimitAndHasNoPendingAttempts()
        ? R.string.attention
        : R.string.attemptOf(
            presenter.hasPendingAttempt()
                ? presenter.attemptsCreatedLength()
                : presenter.newAttemptNumber(),
            presenter.maxAttempts());
  }

  String _getSubtitle() {
    return achieveAttemptsLimitAndHasNoPendingAttempts()
        ? R.string.youHaveNoMoreAttempts
        : R.string.whenAssessmentBeginYouWillHave(presenter.timeInMinutes());
  }

  IconWaveType iconType() {
    return achieveAttemptsLimitAndHasNoPendingAttempts()
        ? IconWaveType.danger
        : IconWaveType.info;
  }

  Widget body(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (presenter.couldCreateNewAttempt())
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: PrimaryButton.sizeXl(
                  text: R.string.initAttempt(presenter.newAttemptNumber()),
                  onPressed: () async {
                    var result = await presenter.createAttempt();
                    if (result != null) {
                      navigateToAssessment(
                        attemptNumber: presenter.newAttemptNumber(),
                        context: context,
                        attempt: result,
                        visualizeOnly: false,
                      );
                    }
                  },
                ),
              ),
              const SpacingVertical.spacing08(),
            ],
          ),
        ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) => SizedBox(
            width: double.infinity,
            child: presenter.isAttemptPending(index)
                ? PrimaryButton.sizeXl(
                    text: R.string.continueAttempt(index + 1),
                    onPressed: () => visualizeAttempt(
                      context: context,
                      index: index,
                      visualizeOnly: false,
                    ),
                  )
                : SecondaryButton.sizeXl(
                    text: R.string.visualizeAttempt(index + 1),
                    onPressed: () => visualizeAttempt(
                      context: context,
                      index: index,
                      visualizeOnly: true,
                    ),
                  ),
          ),
          separatorBuilder: (context, _) => const SpacingVertical.spacing08(),
          itemCount: presenter.attemptsCreatedLength(),
        ),
      ],
    );
  }
}
