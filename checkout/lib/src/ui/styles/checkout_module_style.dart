import 'package:design_system/design_system.dart';

abstract class CheckoutStyle with PrimaryModuleStyleMixin {}

class CheckoutModuleStyle extends CheckoutStyle {
  CheckoutModuleStyle._privateConstructor();

  static final CheckoutModuleStyle instance =
      CheckoutModuleStyle._privateConstructor();
}

CheckoutModuleStyle get moduleStyle => CheckoutModuleStyle.instance;
