import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../account_deletion_presenter.dart';

class DeletionConfirmationBottomSheet extends StatelessWidget {
  const DeletionConfirmationBottomSheet({
    super.key,
    required this.presenter,
  });

  final AccountDeletionPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBaseWidget(
      iconWaveWidget: const IconWaveWidget(
        icon: Icons.trash04,
        iconWaveType: IconWaveType.danger,
      ),
      body: Column(
        children: [
          InputBaseWidget(
            maxLines: 8,
            textInputType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            placeHolder: R.string.deletionConfirmationDescription,
            radius: Sizes.size08,
            onChanged: (value) => presenter.text = value,
          ),
          const SpacingVertical.spacing16(),
          Row(
            children: [
              Expanded(
                child: SecondaryButton.sizeMd(
                  text: R.string.cancel,
                  onPressed: () => Route66.pop<bool>(result: false),
                ),
              ),
              const SpacingHorizontal.spacing08(),
              Expanded(
                child: DestructiveButton.sizeMd(
                  text: R.string.removeMyAccount,
                  onPressed: () => Route66.pop<bool>(result: true),
                ),
              ),
            ],
          ),
        ],
      ),
      title: R.string.deletionConfirmationQuestion,
    );
  }
}
