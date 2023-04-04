import 'package:design_system/design_system.dart';

class TextQuaternaryStyle extends TextBaseColorStyle<TextQuaternaryStyle> {
  TextQuaternaryStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static TextQuaternaryStyle light = TextQuaternaryStyle(
    primaryColor: Colors.yellow600,
    secondaryColor: Colors.yellow500,
    tertiaryColor: Colors.yellow050,
  );

  static TextQuaternaryStyle dark = TextQuaternaryStyle(
    primaryColor: Colors.yellow400,
    secondaryColor: Colors.yellow500,
    tertiaryColor: Colors.yellow900,
  );

  @override
  ThemeExtension<TextQuaternaryStyle> lerp(
    ThemeExtension<TextQuaternaryStyle>? other,
    double t,
  ) =>
      this;

  @override
  TextQuaternaryStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return TextQuaternaryStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static TextQuaternaryStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<TextQuaternaryStyle>();
}
