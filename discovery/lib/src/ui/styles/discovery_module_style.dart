import 'package:design_system/design_system.dart';

abstract class DiscoveryStyle
    with
        PrimaryModuleStyleMixin,
        SecondaryModuleStyleMixin,
        TertiaryModuleStyleMixin,
        QuaternaryModuleStyleMixin {}

class DiscoveryModuleStyle extends DiscoveryStyle {
  DiscoveryModuleStyle._privateConstructor();

  static final DiscoveryModuleStyle instance =
      DiscoveryModuleStyle._privateConstructor();
}

DiscoveryModuleStyle get moduleStyle => DiscoveryModuleStyle.instance;
