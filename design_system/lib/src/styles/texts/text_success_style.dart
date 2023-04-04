import 'package:design_system/design_system.dart';

class TextSuccessStyle extends TextBaseColorStyle<TextSuccessStyle> {
  TextSuccessStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static TextSuccessStyle light = TextSuccessStyle(
    primaryColor: Colors.success600,
    secondaryColor: Colors.success700,
  );

  static TextSuccessStyle dark = TextSuccessStyle(
    primaryColor: Colors.success400,
    secondaryColor: Colors.success300,
  );

  @override
  ThemeExtension<TextSuccessStyle> lerp(
    ThemeExtension<TextSuccessStyle>? other,
    double t,
  ) =>
      this;

  @override
  TextSuccessStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return TextSuccessStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static TextSuccessStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<TextSuccessStyle>();
}
