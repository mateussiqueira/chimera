import 'package:design_system/design_system.dart';

abstract class CartStyle with TertiaryModuleStyleMixin {}

class CartModuleStyle extends CartStyle {
  CartModuleStyle._privateConstructor();

  static final CartModuleStyle instance = CartModuleStyle._privateConstructor();
}

CartModuleStyle get moduleStyle => CartModuleStyle.instance;
