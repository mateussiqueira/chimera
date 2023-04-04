import 'package:design_system/design_system.dart';
import 'package:learning/src/ui/pages/assessment/widgets/assessment_send_attempt/back_to_courses_button.dart';
import 'package:learning/src/ui/pages/assessment/widgets/assessment_send_attempt/retry_assessment_button.dart';

import 'visualize_attempt_button.dart';

class AssessmentSendAttemptButton extends StatelessWidget {
  const AssessmentSendAttemptButton({
    Key? key,
    required this.approved,
    required this.canRetry,
  }) : super(key: key);

  final bool approved;
  final bool canRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (approved && canRetry) ...[
          const VisualizeAttemptButton(
            primary: true,
          ),
          const SpacingVertical.spacing08(),
          const RetryAssessmentButton(
            primary: false,
          )
        ] else if (approved && !canRetry) ...[
          const VisualizeAttemptButton(
            primary: true,
          ),
          const SpacingVertical.spacing08(),
          const BackToCoursesButton(),
        ] else if (!approved && canRetry) ...[
          const RetryAssessmentButton(
            primary: true,
          ),
          const SpacingVertical.spacing08(),
          const VisualizeAttemptButton(
            primary: false,
          )
        ] else if (!approved && !canRetry) ...[
          const VisualizeAttemptButton(
            primary: false,
          ),
          const SpacingVertical.spacing08(),
          const BackToCoursesButton(),
        ]
      ],
    );
  }
}
