import 'package:design_system/design_system.dart';

class BackgroundQuaternaryStyle
    extends BackgroundBaseColorStyle<BackgroundQuaternaryStyle> {
  BackgroundQuaternaryStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static BackgroundQuaternaryStyle light = BackgroundQuaternaryStyle(
    primaryColor: Colors.yellow050,
    secondaryColor: Colors.yellow100,
    tertiaryColor: Colors.yellow200,
  );

  static BackgroundQuaternaryStyle dark = BackgroundQuaternaryStyle(
    primaryColor: Colors.yellow900,
    secondaryColor: Colors.yellow800,
    tertiaryColor: Colors.yellow700,
  );

  @override
  ThemeExtension<BackgroundQuaternaryStyle> lerp(
    ThemeExtension<BackgroundQuaternaryStyle>? other,
    double t,
  ) =>
      this;

  @override
  BackgroundQuaternaryStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return BackgroundQuaternaryStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static BackgroundQuaternaryStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<BackgroundQuaternaryStyle>();
}
