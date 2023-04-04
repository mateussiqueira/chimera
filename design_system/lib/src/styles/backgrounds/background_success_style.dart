import 'package:design_system/design_system.dart';

class BackgroundSuccessStyle
    extends BackgroundBaseColorStyle<BackgroundSuccessStyle> {
  BackgroundSuccessStyle({
    super.primaryColor,
    super.secondaryColor,
    super.tertiaryColor,
    super.quaternaryColor,
  });

  static BackgroundSuccessStyle light = BackgroundSuccessStyle(
    primaryColor: Colors.success050,
    secondaryColor: Colors.success100,
    tertiaryColor: Colors.success200,
  );

  static BackgroundSuccessStyle dark = BackgroundSuccessStyle(
    primaryColor: Colors.success900,
    secondaryColor: Colors.success800,
    tertiaryColor: Colors.success700,
  );

  @override
  ThemeExtension<BackgroundSuccessStyle> lerp(
    ThemeExtension<BackgroundSuccessStyle>? other,
    double t,
  ) =>
      this;

  @override
  BackgroundSuccessStyle copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
  }) {
    return BackgroundSuccessStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
    );
  }

  static BackgroundSuccessStyle? themeExtension(BuildContext context) =>
      context.resolveStyle<BackgroundSuccessStyle>();
}
