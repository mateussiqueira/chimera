import 'package:design_system/design_system.dart';

abstract class BaseModulePresenterStyle {
  TextBaseColorStyle? textModuleStyle(BuildContext context);

  TextStyle? textModuleStyleWithPrimaryColor(BuildContext context);

  TextStyle? textModuleStyleWithSecondaryColor(BuildContext context);

  TextStyle? textModuleStyleWithTertiaryColor(BuildContext context);

  TextStyle? textModuleStyleWithQuaternaryColor(BuildContext context);

  Color? textModulePrimaryColor(BuildContext context);

  Color? textModuleSecondaryColor(BuildContext context);

  Color? textModuleTertiaryColor(BuildContext context);

  Color? textModuleQuaternaryColor(BuildContext context);

  BackgroundBaseColorStyle? backgroundModuleStyle(BuildContext context);

  Color? backgroundModulePrimaryColor(BuildContext context);

  Color? backgroundModuleSecondaryColor(BuildContext context);

  Color? backgroundModuleTertiaryColor(BuildContext context);

  Color? backgroundModuleQuaternaryColor(BuildContext context);
}
