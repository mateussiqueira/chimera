import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class AttemptsOverBottomSheet extends StatelessWidget {
  const AttemptsOverBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetBaseWidget(
      iconWaveWidget: const IconWaveWidget(
        icon: Icons.alertCircle,
        iconWaveType: IconWaveType.danger,
      ),
      title: R.string.timesUp,
      subtitle: R.string.finalResultMsg,
      body: ButtonsOkCancelVerticalWidget(
        primaryButtonTitle: R.string.backToCourses,
        primaryButtonOnPressed: () => Navigator.of(context).pop(true),
        secondaryButtonTitle: R.string.visualizeAnswer,
        secondaryButtonOnPressed: () => Navigator.of(context).pop(false),
      ),
    );
  }
}
