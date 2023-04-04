import 'package:design_system/design_system.dart';

class PrimaryModuleStyle extends BaseModuleStyle {
  PrimaryModuleStyle._();
  factory PrimaryModuleStyle() => _instance ??= PrimaryModuleStyle._();
  static PrimaryModuleStyle? _instance;

  @override
  TextBaseColorStyle? textModuleStyle(BuildContext context) =>
      TextPrimaryStyle.themeExtension(context);

  @override
  BackgroundBaseColorStyle? backgroundModuleStyle(BuildContext context) =>
      BackgroundPrimaryStyle.themeExtension(context);
}

PrimaryModuleStyle get primaryModuleStyle => PrimaryModuleStyle();
