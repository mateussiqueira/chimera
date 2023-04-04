import 'package:design_system/design_system.dart';

mixin DangerModuleStyleMixin {
  DangerModuleStyle _danger = DangerModuleStyle();

  DangerModuleStyle get danger => _danger;
  set danger(DangerModuleStyle moduleStyle) => _danger = moduleStyle;
}
