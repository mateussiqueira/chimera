import 'package:design_system/design_system.dart';

import '../../../styles/learning_module_style.dart';

class AssessmentTimerWidget extends StatelessWidget {
  const AssessmentTimerWidget({
    super.key,
    required this.remainingSeconds,
  });

  final int? remainingSeconds;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: Sizes.size08, horizontal: Sizes.size16),
      color: moduleStyle.primary.backgroundModuleSecondaryColor(context),
      child: Row(
        children: [
          Icons.clock.iconCopyWith(
              color: moduleStyle.primary.textModulePrimaryColor(context)),
          const SpacingHorizontal.spacing08(),
          TextWidget.textSmNormal(
            text: timeFormatted(remainingSeconds),
            style: moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
          ),
        ],
      ),
    );
  }

  String timeFormatted(int? seconds) {
    return _printDuration(Duration(seconds: seconds ?? 0));
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
