import 'package:design_system/design_system.dart';

abstract class ProfileStyle
    with
        PrimaryModuleStyleMixin,
        SecondaryModuleStyleMixin,
        QuaternaryModuleStyleMixin,
        DangerModuleStyleMixin {}

class ProfileModuleStyle extends ProfileStyle {
  ProfileModuleStyle._privateConstructor();

  static final ProfileModuleStyle instance =
      ProfileModuleStyle._privateConstructor();
}

ProfileModuleStyle get moduleStyle => ProfileModuleStyle.instance;
