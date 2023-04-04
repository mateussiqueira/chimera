import 'package:design_system/design_system.dart';

class BottomSheetBaseWidget extends StatelessWidget {
  const BottomSheetBaseWidget({
    super.key,
    this.iconWaveWidget,
    this.subtitle,
    this.title,
    required this.body,
  });

  final IconWaveWidget? iconWaveWidget;
  final String? title;
  final String? subtitle;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    PrimaryModuleStyle? resolvedStyle = primaryModuleStyle;
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (iconWaveWidget != null) ...[
            iconWaveWidget!,
            const SpacingVertical.spacing16(),
          ],
          if (title != null) ...[
            TextWidget.displayLgBold(
              text: title!,
              style: resolvedStyle.textModuleStyleWithPrimaryColor(context),
              textAlign: TextAlign.center,
            ),
            const SpacingVertical.spacing08(),
          ],
          if (subtitle != null) ...[
            TextWidget.textSmNormal(
              text: subtitle!,
              style: resolvedStyle.textModuleStyleWithPrimaryColor(context),
              textAlign: TextAlign.center,
            ),
            const SpacingVertical.spacing16(),
          ],
          body
        ]);
  }
}
