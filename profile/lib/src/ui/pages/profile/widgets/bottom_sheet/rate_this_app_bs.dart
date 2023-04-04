import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../../../styles/profile_module_style.dart';

class RateThisAppBottomSheet extends StatelessWidget {
  const RateThisAppBottomSheet({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBaseWidget(
      iconWaveWidget: const IconWaveWidget(
        icon: Icons.star01,
        iconWaveType: IconWaveType.info,
      ),
      body: Column(
        children: [
          ButtonsOkCancelHorizontalWidget(
            primaryButtonTitle: R.string.yes,
            primaryButtonOnPressed: () => Navigator.of(context).pop(true),
            secondaryButtonTitle: R.string.no,
            secondaryButtonOnPressed: () => Navigator.of(context).pop(false),
          ),
          TextButtonWidget(
            child: TextWidget.textSmMedium(
              text: R.string.dontRatingNow,
              style:
                  moduleStyle.primary.textModuleStyleWithPrimaryColor(context),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      title: R.string.areYouRatingApp(name),
    );
  }
}
