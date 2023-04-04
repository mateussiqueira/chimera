import 'package:design_system/design_system.dart';

class BackgroundTertiaryStyle
    extends BackgroundBaseColorStyle<BackgroundTertiaryStyle> {
  BackgroundTertiaryStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static BackgroundTertiaryStyle light = BackgroundTertiaryStyle(
    primaryColor: Colors.primary050,
    secondaryColor: Colors.primary100,
    tertiaryColor: Colors.primary200,
    quaternaryColor: Colors.primary300,
  );

  static BackgroundTertiaryStyle dark = BackgroundTertiaryStyle(
    primaryColor: Colors.primary900,
    secondaryColor: Colors.primary800,
    tertiaryColor: Colors.primary700,
  );

  @override
  ThemeExtension<BackgroundTertiaryStyle> lerp(
    ThemeExtension<BackgroundTertiaryStyle>? other,
    double t,
  ) =>
      this;

  @override
  BackgroundTertiaryStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return BackgroundTertiaryStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static BackgroundTertiaryStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<BackgroundTertiaryStyle>();
}
