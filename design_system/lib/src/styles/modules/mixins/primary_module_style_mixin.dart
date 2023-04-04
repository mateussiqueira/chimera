import 'package:design_system/design_system.dart';

mixin PrimaryModuleStyleMixin {
  PrimaryModuleStyle _primary = PrimaryModuleStyle();

  PrimaryModuleStyle get primary => _primary;
  set primary(PrimaryModuleStyle moduleStyle) => _primary = moduleStyle;
}
