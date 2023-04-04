import 'package:design_system/design_system.dart';

class TertiaryModuleStyle extends BaseModuleStyle {
  TertiaryModuleStyle._();
  factory TertiaryModuleStyle() => _instance ??= TertiaryModuleStyle._();
  static TertiaryModuleStyle? _instance;

  @override
  TextBaseColorStyle? textModuleStyle(BuildContext context) =>
      TextTertiaryStyle.themeExtension(context);

  @override
  BackgroundBaseColorStyle? backgroundModuleStyle(BuildContext context) =>
      BackgroundTertiaryStyle.themeExtension(context);
}

TertiaryModuleStyle get tertiaryModuleStyle => TertiaryModuleStyle();
