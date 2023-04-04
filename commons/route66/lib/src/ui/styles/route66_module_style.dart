import 'package:design_system/design_system.dart';

abstract class Route66Style
    with
        PrimaryModuleStyleMixin,
        SecondaryModuleStyleMixin,
        TertiaryModuleStyleMixin {}

class Route66ModuleStyle extends Route66Style {
  Route66ModuleStyle._privateConstructor();

  static final Route66ModuleStyle instance =
      Route66ModuleStyle._privateConstructor();
}

Route66ModuleStyle get moduleStyle => Route66ModuleStyle.instance;
