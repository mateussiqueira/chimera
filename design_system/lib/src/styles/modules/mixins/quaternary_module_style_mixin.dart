import 'package:design_system/design_system.dart';

mixin QuaternaryModuleStyleMixin {
  QuaternaryModuleStyle _quaternary = QuaternaryModuleStyle();

  QuaternaryModuleStyle get quaternary => _quaternary;
  set quaternary(QuaternaryModuleStyle moduleStyle) =>
      _quaternary = moduleStyle;
}
