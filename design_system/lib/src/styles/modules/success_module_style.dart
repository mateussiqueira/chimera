import 'package:design_system/design_system.dart';

class SuccessModuleStyle extends BaseModuleStyle {
  SuccessModuleStyle._();
  factory SuccessModuleStyle() => _instance ??= SuccessModuleStyle._();
  static SuccessModuleStyle? _instance;

  @override
  TextBaseColorStyle? textModuleStyle(BuildContext context) =>
      TextSuccessStyle.themeExtension(context);

  @override
  BackgroundBaseColorStyle? backgroundModuleStyle(BuildContext context) =>
      BackgroundSuccessStyle.themeExtension(context);
}

SuccessModuleStyle get successModuleStyle => SuccessModuleStyle();
