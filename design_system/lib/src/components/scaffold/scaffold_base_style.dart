import '../../../design_system.dart';

class ScaffoldBaseStyle extends ThemeExtension<ScaffoldBaseStyle> {
  const ScaffoldBaseStyle({
    this.appBarBackgroundColor,
    this.bodyBackgroundColor,
    this.bottomNavigationBarBackgroundColor,
  });

  final Color? appBarBackgroundColor;
  final Color? bodyBackgroundColor;
  final Color? bottomNavigationBarBackgroundColor;

  static const ScaffoldBaseStyle light = ScaffoldBaseStyle();

  @override
  ThemeExtension<ScaffoldBaseStyle> copyWith({
    Color? appBarBackgroundColor,
    Color? bodyBackgroundColor,
    Color? bottomNavigationBarBackgroundColor,
  }) =>
      ScaffoldBaseStyle(
        appBarBackgroundColor:
            appBarBackgroundColor ?? this.appBarBackgroundColor,
        bodyBackgroundColor: bodyBackgroundColor ?? this.bodyBackgroundColor,
        bottomNavigationBarBackgroundColor:
            bottomNavigationBarBackgroundColor ??
                this.bottomNavigationBarBackgroundColor,
      );

  @override
  ThemeExtension<ScaffoldBaseStyle> lerp(
          ThemeExtension<ScaffoldBaseStyle>? other, double t) =>
      this;
}
