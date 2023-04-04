import 'package:design_system/design_system.dart';

class TextTertiaryStyle extends TextBaseColorStyle<TextTertiaryStyle> {
  TextTertiaryStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static TextTertiaryStyle light = TextTertiaryStyle(
    primaryColor: Colors.primary900,
    secondaryColor: Colors.primary600,
    tertiaryColor: Colors.blue500,
  );

  static TextTertiaryStyle dark = TextTertiaryStyle(
    primaryColor: Colors.primary100,
    secondaryColor: Colors.primary400,
    tertiaryColor: Colors.blue500,
  );

  @override
  ThemeExtension<TextTertiaryStyle> lerp(
    ThemeExtension<TextTertiaryStyle>? other,
    double t,
  ) =>
      this;

  @override
  TextTertiaryStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return TextTertiaryStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static TextTertiaryStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<TextTertiaryStyle>();
}
