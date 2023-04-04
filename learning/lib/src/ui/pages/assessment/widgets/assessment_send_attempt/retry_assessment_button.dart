import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/assessment/after_send_action.dart';

class RetryAssessmentButton extends StatelessWidget {
  const RetryAssessmentButton({
    Key? key,
    required this.primary,
  }) : super(key: key);

  final bool primary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: primary
          ? PrimaryButton.sizeXl(
              text: R.string.retryAssessment,
              onPressed: action,
            )
          : SecondaryButton.sizeXl(
              text: R.string.retryAssessment,
              onPressed: action,
            ),
    );
  }

  void action() {
    Route66.pop(result: AfterSendAction.tryAgain);
  }
}
