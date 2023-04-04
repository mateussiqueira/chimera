import 'package:design_system/design_system.dart';

class TextSecondaryStyle extends TextBaseColorStyle<TextSecondaryStyle> {
  TextSecondaryStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static TextSecondaryStyle light = TextSecondaryStyle(
    primaryColor: Colors.neutral050,
    secondaryColor: Colors.neutral300,
    tertiaryColor: Colors.neutral400,
    quaternaryColor: Colors.neutral025,
  );

  static TextSecondaryStyle dark = TextSecondaryStyle(
    primaryColor: Colors.neutral700,
    secondaryColor: Colors.neutral500,
    tertiaryColor: Colors.neutral400,
  );

  @override
  ThemeExtension<TextSecondaryStyle> lerp(
    ThemeExtension<TextSecondaryStyle>? other,
    double t,
  ) =>
      this;

  @override
  TextSecondaryStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return TextSecondaryStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static TextSecondaryStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<TextSecondaryStyle>();
}
