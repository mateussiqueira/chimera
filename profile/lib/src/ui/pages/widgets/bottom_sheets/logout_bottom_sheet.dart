import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetBaseWidget(
      iconWaveWidget: const IconWaveWidget(
        icon: Icons.alertCircle,
        iconWaveType: IconWaveType.info,
      ),
      body: ButtonsOkCancelHorizontalWidget(
        primaryButtonTitle: R.string.yes,
        primaryButtonOnPressed: () => Navigator.of(context).pop(true),
        secondaryButtonTitle: R.string.no,
        secondaryButtonOnPressed: () => Navigator.of(context).pop(false),
      ),
      title: R.string.areYouSureLeaving,
    );
  }
}
