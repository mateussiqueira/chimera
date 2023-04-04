import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class SendAttemptAttentionBottomSheet extends StatelessWidget {
  const SendAttemptAttentionBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetBaseWidget(
      title: R.string.attention,
      subtitle: R.string.sendAssessmentAttentionMsg,
      body: ButtonsOkCancelVerticalWidget(
        primaryButtonTitle: R.string.yesSend,
        primaryButtonOnPressed: () => Navigator.of(context).pop(true),
        secondaryButtonTitle: R.string.backToAssessment,
        secondaryButtonOnPressed: () => Navigator.of(context).pop(false),
      ),
    );
  }
}
