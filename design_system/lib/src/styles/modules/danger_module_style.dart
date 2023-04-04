import 'package:design_system/design_system.dart';

class DangerModuleStyle extends BaseModuleStyle {
  DangerModuleStyle._();
  factory DangerModuleStyle() => _instance ??= DangerModuleStyle._();
  static DangerModuleStyle? _instance;

  @override
  TextBaseColorStyle? textModuleStyle(BuildContext context) =>
      TextDangerStyle.themeExtension(context);

  @override
  BackgroundBaseColorStyle? backgroundModuleStyle(BuildContext context) =>
      BackgroundDangerStyle.themeExtension(context);
}

DangerModuleStyle get dangerModuleStyle => DangerModuleStyle();
