import 'package:design_system/design_system.dart';

class TextDangerStyle extends TextBaseColorStyle<TextDangerStyle> {
  TextDangerStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static TextDangerStyle light = TextDangerStyle(
    primaryColor: Colors.danger600,
    secondaryColor: Colors.danger700,
  );

  static TextDangerStyle dark = TextDangerStyle(
    primaryColor: Colors.danger400,
    secondaryColor: Colors.danger300,
  );

  @override
  ThemeExtension<TextDangerStyle> lerp(
    ThemeExtension<TextDangerStyle>? other,
    double t,
  ) =>
      this;

  @override
  TextDangerStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return TextDangerStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static TextDangerStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<TextDangerStyle>();
}
