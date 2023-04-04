import 'package:design_system/design_system.dart';

class BaseModuleStyle implements BaseModulePresenterStyle {
  @override
  TextBaseColorStyle? textModuleStyle(BuildContext context) =>
      TextPrimaryStyle.themeExtension(context);

  @override
  TextStyle? textModuleStyleWithPrimaryColor(BuildContext context) =>
      textModuleStyle(context)?.primaryColorTextSytle;

  @override
  TextStyle? textModuleStyleWithSecondaryColor(BuildContext context) =>
      textModuleStyle(context)?.secondaryColorTextSytle;

  @override
  TextStyle? textModuleStyleWithTertiaryColor(BuildContext context) =>
      textModuleStyle(context)?.tertiaryColorTextSytle;

  @override
  TextStyle? textModuleStyleWithQuaternaryColor(BuildContext context) =>
      textModuleStyle(context)?.quaternaryColorTextSytle;

  @override
  Color? textModulePrimaryColor(BuildContext context) =>
      textModuleStyle(context)?.primaryColor;

  @override
  Color? textModuleSecondaryColor(BuildContext context) =>
      textModuleStyle(context)?.secondaryColor;

  @override
  Color? textModuleTertiaryColor(BuildContext context) =>
      textModuleStyle(context)?.tertiaryColor;

  @override
  Color? textModuleQuaternaryColor(BuildContext context) =>
      textModuleStyle(context)?.quaternaryColor;

  @override
  BackgroundBaseColorStyle? backgroundModuleStyle(BuildContext context) =>
      BackgroundPrimaryStyle.themeExtension(context);

  @override
  Color? backgroundModulePrimaryColor(BuildContext context) =>
      backgroundModuleStyle(context)?.primaryColor;

  @override
  Color? backgroundModuleSecondaryColor(BuildContext context) =>
      backgroundModuleStyle(context)?.secondaryColor;

  @override
  Color? backgroundModuleTertiaryColor(BuildContext context) =>
      backgroundModuleStyle(context)?.tertiaryColor;

  @override
  Color? backgroundModuleQuaternaryColor(BuildContext context) =>
      backgroundModuleStyle(context)?.quaternaryColor;
}
