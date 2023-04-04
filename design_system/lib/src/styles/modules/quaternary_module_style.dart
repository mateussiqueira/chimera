import 'package:design_system/design_system.dart';

class QuaternaryModuleStyle extends BaseModuleStyle {
  QuaternaryModuleStyle._();
  factory QuaternaryModuleStyle() => _instance ??= QuaternaryModuleStyle._();
  static QuaternaryModuleStyle? _instance;

  @override
  TextBaseColorStyle? textModuleStyle(BuildContext context) =>
      TextQuaternaryStyle.themeExtension(context);

  @override
  BackgroundBaseColorStyle? backgroundModuleStyle(BuildContext context) =>
      BackgroundQuaternaryStyle.themeExtension(context);
}

QuaternaryModuleStyle get quaternaryModuleStyle => QuaternaryModuleStyle();
