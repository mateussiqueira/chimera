import 'package:design_system/design_system.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
    this.onPressed,
    this.iconColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    PrimaryModuleStyle? resolvedStyle = primaryModuleStyle;
    return IconButton(
      icon: Icons.chevronLeft.iconCopyWith(
        color: iconColor ?? resolvedStyle.textModulePrimaryColor(context),
      ),
      color: iconColor ?? resolvedStyle.textModulePrimaryColor(context),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
      splashRadius: 1,
    );
  }
}
