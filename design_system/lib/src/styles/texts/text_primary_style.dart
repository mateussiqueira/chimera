import 'package:design_system/design_system.dart';

class TextPrimaryStyle extends TextBaseColorStyle<TextPrimaryStyle> {
  TextPrimaryStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static TextPrimaryStyle light = TextPrimaryStyle(
    primaryColor: Colors.neutral700,
    secondaryColor: Colors.neutral500,
    tertiaryColor: Colors.neutral400,
  );

  static TextPrimaryStyle dark = TextPrimaryStyle(
    primaryColor: Colors.neutral050,
    secondaryColor: Colors.neutral300,
    tertiaryColor: Colors.neutral400,
  );

  @override
  ThemeExtension<TextPrimaryStyle> lerp(
    ThemeExtension<TextPrimaryStyle>? other,
    double t,
  ) =>
      this;

  @override
  TextPrimaryStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return TextPrimaryStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static TextPrimaryStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<TextPrimaryStyle>();
}
