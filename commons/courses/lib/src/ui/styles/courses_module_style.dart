import 'package:design_system/design_system.dart';

abstract class CoursesStyle
    with
        PrimaryModuleStyleMixin,
        SecondaryModuleStyleMixin,
        TertiaryModuleStyleMixin,
        QuaternaryModuleStyleMixin,
        SuccessModuleStyleMixin,
        DangerModuleStyleMixin {}

class CoursesModuleStyle extends CoursesStyle {
  CoursesModuleStyle._privateConstructor();

  static final CoursesModuleStyle instance =
      CoursesModuleStyle._privateConstructor();
}

CoursesModuleStyle get moduleStyle => CoursesModuleStyle.instance;
