import 'package:design_system/design_system.dart';

class HorizontalDividerWidget extends StatelessWidget {
  const HorizontalDividerWidget({
    Key? key,
    this.text,
    this.style,
  }) : super(key: key);

  final String? text;
  final HorizontalDividerStyle? style;

  HorizontalDividerStyle? getStyle(BuildContext context) {
    final resolvedStyle = context.resolveStyle<HorizontalDividerStyle>();
    return style ?? resolvedStyle ?? HorizontalDividerStyle.light;
  }

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return _divider(context);
    }
    PrimaryModuleStyle? resolvedStyle = primaryModuleStyle;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _divider(context),
        Expanded(child: _divider(context)),
        const SpacingHorizontal.spacing08(),
        TextWidget.textSmNormal(
          text: text ?? '',
          style: TextStyle(
            color: getStyle(context)?.foregroundColor ??
                resolvedStyle.textModuleTertiaryColor(context),
          ),
        ),
        const SpacingHorizontal.spacing08(),
        Expanded(child: _divider(context)),
      ],
    );
  }

  Widget _divider(BuildContext context) => Container(
        color: getStyle(context)?.dividerColor ?? dividerDefaultColor(context),
        height: 0.5,
      );

  Color? dividerDefaultColor(BuildContext context) {
    PrimaryModuleStyle? resolvedStyle = primaryModuleStyle;
    return resolvedStyle.backgroundModuleTertiaryColor(context);
  }
}
