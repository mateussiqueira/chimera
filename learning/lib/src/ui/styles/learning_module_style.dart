import 'package:design_system/design_system.dart';

abstract class LearningStyle
    with
        PrimaryModuleStyleMixin,
        SecondaryModuleStyleMixin,
        TertiaryModuleStyleMixin,
        QuaternaryModuleStyleMixin,
        SuccessModuleStyleMixin,
        DangerModuleStyleMixin {}

class LearningModuleStyle extends LearningStyle {
  LearningModuleStyle._privateConstructor();

  static final LearningModuleStyle instance =
      LearningModuleStyle._privateConstructor();
}

LearningModuleStyle get moduleStyle => LearningModuleStyle.instance;
