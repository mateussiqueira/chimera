import 'package:design_system/design_system.dart';

class BackgroundDangerStyle
    extends BackgroundBaseColorStyle<BackgroundDangerStyle> {
  BackgroundDangerStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static BackgroundDangerStyle light = BackgroundDangerStyle(
    primaryColor: Colors.danger050,
    secondaryColor: Colors.danger100,
    tertiaryColor: Colors.danger200,
    quaternaryColor: Colors.danger300,
  );

  static BackgroundDangerStyle dark = BackgroundDangerStyle(
    primaryColor: Colors.danger900,
    secondaryColor: Colors.danger800,
    tertiaryColor: Colors.danger700,
  );

  @override
  ThemeExtension<BackgroundDangerStyle> lerp(
    ThemeExtension<BackgroundDangerStyle>? other,
    double t,
  ) =>
      this;

  @override
  BackgroundDangerStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return BackgroundDangerStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static BackgroundDangerStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<BackgroundDangerStyle>();
}
