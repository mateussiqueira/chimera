import 'package:design_system/design_system.dart';

class ButtonsOkCancelHorizontalWidget extends StatelessWidget {
  const ButtonsOkCancelHorizontalWidget({
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
    return Row(
      children: [
        Expanded(
          child: SecondaryButton.sizeXl(
            text: secondaryButtonTitle,
            onPressed: secondaryButtonOnPressed,
          ),
        ),
        const SpacingHorizontal.spacing08(),
        Expanded(
          child: PrimaryButton.sizeXl(
            text: primaryButtonTitle,
            onPressed: primaryButtonOnPressed,
          ),
        ),
      ],
    );
  }
}
