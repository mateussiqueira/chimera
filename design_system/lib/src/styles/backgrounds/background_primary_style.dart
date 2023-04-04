import 'package:design_system/design_system.dart';

class BackgroundPrimaryStyle
    extends BackgroundBaseColorStyle<BackgroundPrimaryStyle> {
  const BackgroundPrimaryStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static BackgroundPrimaryStyle light = const BackgroundPrimaryStyle(
    primaryColor: Colors.neutral100,
    secondaryColor: Colors.white,
    tertiaryColor: Colors.neutral200,
    quaternaryColor: Colors.neutral025,
  );

  static BackgroundPrimaryStyle dark = const BackgroundPrimaryStyle(
    primaryColor: Colors.neutral700,
    secondaryColor: Colors.neutral900,
    tertiaryColor: Colors.neutral800,
  );

  @override
  ThemeExtension<BackgroundPrimaryStyle> lerp(
    ThemeExtension<BackgroundPrimaryStyle>? other,
    double t,
  ) =>
      this;

  @override
  BackgroundPrimaryStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return BackgroundPrimaryStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static BackgroundPrimaryStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<BackgroundPrimaryStyle>();
}
