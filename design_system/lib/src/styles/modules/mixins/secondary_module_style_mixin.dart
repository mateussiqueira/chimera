import 'package:design_system/design_system.dart';

mixin SecondaryModuleStyleMixin {
  SecondaryModuleStyle _secondary = SecondaryModuleStyle();

  SecondaryModuleStyle get secondary => _secondary;
  set secondary(SecondaryModuleStyle moduleStyle) => _secondary = moduleStyle;
}
