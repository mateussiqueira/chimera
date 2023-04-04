import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class SendAttemptBottomSheet extends StatelessWidget {
  const SendAttemptBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetBaseWidget(
      title: R.string.sendAssessment,
      subtitle: R.string.sendAssessmentMsg,
      body: ButtonsOkCancelVerticalWidget(
        primaryButtonTitle: R.string.yesSend,
        primaryButtonOnPressed: () => Navigator.of(context).pop(true),
        secondaryButtonTitle: R.string.backToAssessment,
        secondaryButtonOnPressed: () => Navigator.of(context).pop(false),
      ),
    );
  }
}
