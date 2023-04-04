import 'package:design_system/design_system.dart';

class IconWaveWidget extends StatelessWidget {
  const IconWaveWidget({
    super.key,
    required this.icon,
    required this.iconWaveType,
  });

  final Icons icon;
  final IconWaveType iconWaveType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.size48,
      height: Sizes.size48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _outerCircleColor(context),
      ),
      child: Center(
        child: Container(
          width: Sizes.size36,
          height: Sizes.size36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _innerCircleColor(context),
          ),
          child: Center(
            child: SizedBox(
              width: Sizes.size20,
              height: Sizes.size20,
              child: icon.iconCopyWith(
                color: _iconColor(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconWaveStyle? style(BuildContext context) {
    return context.resolveStyle<IconWaveStyle>();
  }

  DangerModuleStyle? dangerModule(BuildContext context) {
    return dangerModuleStyle;
  }

  TertiaryModuleStyle? infoModule(BuildContext context) {
    return tertiaryModuleStyle;
  }

  Color? _outerCircleColor(BuildContext context) {
    switch (iconWaveType) {
      case IconWaveType.danger:
        return style(context)?.dangerOuterCicleColor ??
            dangerModule(context)?.backgroundModulePrimaryColor(context);
      case IconWaveType.info:
        return style(context)?.infoOuterCicleColor ??
            infoModule(context)?.backgroundModulePrimaryColor(context);
    }
  }

  Color? _innerCircleColor(BuildContext context) {
    switch (iconWaveType) {
      case IconWaveType.danger:
        return style(context)?.dangerInnerCircleColor ??
            dangerModule(context)?.backgroundModuleSecondaryColor(context);
      case IconWaveType.info:
        return style(context)?.infoInnerCircleColor ??
            infoModule(context)?.backgroundModuleSecondaryColor(context);
    }
  }

  Color? _iconColor(BuildContext context) {
    switch (iconWaveType) {
      case IconWaveType.danger:
        return style(context)?.dangerIconColor ??
            dangerModule(context)?.textModulePrimaryColor(context);
      case IconWaveType.info:
        return style(context)?.infoIconColor ??
            infoModule(context)?.textModulePrimaryColor(context);
    }
  }
}
