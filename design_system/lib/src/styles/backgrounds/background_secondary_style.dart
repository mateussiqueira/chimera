import 'package:design_system/design_system.dart';

class BackgroundSecondaryStyle
    extends BackgroundBaseColorStyle<BackgroundSecondaryStyle> {
  BackgroundSecondaryStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static BackgroundSecondaryStyle light = BackgroundSecondaryStyle(
    primaryColor: Colors.primary900,
    secondaryColor: Colors.primary600,
    tertiaryColor: Colors.primary200,
    quaternaryColor: Colors.blueDark900,
  );

  static BackgroundSecondaryStyle dark = BackgroundSecondaryStyle(
    primaryColor: Colors.neutral200,
    secondaryColor: Colors.neutral400,
    tertiaryColor: Colors.neutral700,
  );

  @override
  ThemeExtension<BackgroundSecondaryStyle> lerp(
    ThemeExtension<BackgroundSecondaryStyle>? other,
    double t,
  ) =>
      this;

  @override
  BackgroundSecondaryStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return BackgroundSecondaryStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static BackgroundSecondaryStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<BackgroundSecondaryStyle>();
}
