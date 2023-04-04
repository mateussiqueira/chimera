import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../styles/learning_module_style.dart';
import 'assessment.dart';
import 'widgets/widgets.dart';

class AssessmentSendAttemptPage extends StatelessWidget {
  AssessmentSendAttemptPage({
    super.key,
    required this.presenter,
    required String assessmentId,
    required String attemptId,
    required String enrollmentId,
  }) {
    presenter.init(
      assessmentId: assessmentId,
      attemptId: attemptId,
      enrollmentId: enrollmentId,
    );
  }

  final AssessmentAttemptSendPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: moduleStyle.primary.backgroundModulePrimaryColor(context),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Sizes.size16),
          child: ListenableBuilder(
            listenable: presenter,
            builder: (context) {
              final canRetry = presenter.canRetryAssessment;
              final approved = presenter.approved;
              final percentage = presenter.percentage;

              if (canRetry != null && approved != null && percentage != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        CloseButton(),
                      ],
                    ),
                    LimitedBox(
                      maxHeight: MediaQuery.of(context).size.height * 0.5,
                      child: const AnimationWidget(
                        animation: Animations.assessmentSuccess,
                      ),
                    ),
                    const SpacingVertical.spacing40(),
                    TextWidget.displayLgBold(
                      text: R.string.yourAssessmentAttemptWasSent,
                      style: moduleStyle.primary
                          .textModuleStyleWithPrimaryColor(context),
                    ),
                    const SpacingVertical.spacing08(),
                    AssessmentPercentageWidget(
                      percentage: percentage,
                    ),
                    AssessmentSituationWidget(
                      approved: approved,
                    ),
                    const SpacingVertical.spacing24(),
                    AssessmentSendAttemptButton(
                      approved: approved,
                      canRetry: canRetry,
                    ),
                  ],
                );
              }
              return const EmptyWidget();
            },
          ),
        ),
      ),
    );
  }
}
