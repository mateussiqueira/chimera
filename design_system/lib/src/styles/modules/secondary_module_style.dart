import 'package:design_system/design_system.dart';

class SecondaryModuleStyle extends BaseModuleStyle {
  SecondaryModuleStyle._();
  factory SecondaryModuleStyle() => _instance ??= SecondaryModuleStyle._();
  static SecondaryModuleStyle? _instance;

  @override
  TextBaseColorStyle? textModuleStyle(BuildContext context) =>
      TextSecondaryStyle.themeExtension(context);

  @override
  BackgroundBaseColorStyle? backgroundModuleStyle(BuildContext context) =>
      BackgroundSecondaryStyle.themeExtension(context);
}

SecondaryModuleStyle get secondaryModuleStyle => SecondaryModuleStyle();
