import 'package:design_system/design_system.dart';

class ButtonsOkCancelVerticalWidget extends StatelessWidget {
  const ButtonsOkCancelVerticalWidget({
    super.key,
    required this.primaryButtonTitle,
    required this.primaryButtonOnPressed,
    required this.secondaryButtonTitle,
    required this.secondaryButtonOnPressed,
  });

  final String primaryButtonTitle;
  final VoidCallback? primaryButtonOnPressed;
  final String secondaryButtonTitle;
  final VoidCallback? secondaryButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        width: double.infinity,
        child: PrimaryButton.sizeXl(
          text: primaryButtonTitle,
          onPressed: primaryButtonOnPressed,
        ),
      ),
      const SpacingVertical.spacing08(),
      SizedBox(
        width: double.infinity,
        child: SecondaryButton.sizeXl(
          text: secondaryButtonTitle,
          onPressed: secondaryButtonOnPressed,
        ),
      ),
    ]);
  }
}
