import 'package:design_system/design_system.dart';

abstract class AuthenticationStyle
    with SecondaryModuleStyleMixin, QuaternaryModuleStyleMixin {}

class AuthenticationModuleStyle extends AuthenticationStyle {
  AuthenticationModuleStyle._privateConstructor();

  static final AuthenticationModuleStyle instance =
      AuthenticationModuleStyle._privateConstructor();
}

AuthenticationStyle get moduleStyle => AuthenticationModuleStyle.instance;
