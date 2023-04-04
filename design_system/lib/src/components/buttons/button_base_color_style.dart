import 'package:design_system/design_system.dart';

abstract class ButtonBaseColorStyle<T extends ThemeExtension<T>>
    extends ThemeExtension<T> {
  const ButtonBaseColorStyle({
    this.backgroundDefaultColor,
    this.backgroundDisabledColor,
    this.backgroundPressedColor,
    this.foregroundDefaultColor,
    this.foregroundDisabledColor,
    this.foregroundPressedColor,
  });

  final Color? backgroundDefaultColor;
  final Color? backgroundDisabledColor;
  final Color? backgroundPressedColor;
  final Color? foregroundDefaultColor;
  final Color? foregroundDisabledColor;
  final Color? foregroundPressedColor;
}
