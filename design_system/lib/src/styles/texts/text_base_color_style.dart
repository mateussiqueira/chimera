import 'package:design_system/design_system.dart';

abstract class TextBaseColorStyle<T extends ThemeExtension<T>>
    extends ThemeExtension<T> {
  const TextBaseColorStyle({
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.quaternaryColor,
  });

  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? tertiaryColor;
  final Color? quaternaryColor;

  TextStyle _textStyleWithColor(Color? color) {
    return TextStyle(color: color);
  }

  TextStyle get primaryColorTextSytle => _textStyleWithColor(primaryColor);

  TextStyle get secondaryColorTextSytle => _textStyleWithColor(secondaryColor);

  TextStyle get tertiaryColorTextSytle => _textStyleWithColor(tertiaryColor);

  TextStyle get quaternaryColorTextSytle =>
      _textStyleWithColor(quaternaryColor);
}
