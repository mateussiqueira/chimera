import 'package:design_system/design_system.dart';

class TabBarStyle extends ThemeExtension<TabBarStyle> {
  TabBarStyle({
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelStyle,
    this.unselectedLabelStyle,
  });

  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;

  static TabBarStyle light(BuildContext context) => TabBarStyle(
        labelStyle: TypographyTextMd.bold(context),
        unselectedLabelStyle: TypographyTextMd.medium(context),
      );

  @override
  ThemeExtension<TabBarStyle> copyWith({
    Color? indicatorColor,
    Color? labelColor,
    Color? unselectedLabelColor,
    TextStyle? labelStyle,
    TextStyle? unselectedLabelStyle,
  }) {
    return TabBarStyle(
      indicatorColor: indicatorColor ?? this.indicatorColor,
      labelColor: labelColor ?? this.labelColor,
      unselectedLabelColor: unselectedLabelColor ?? this.unselectedLabelColor,
      labelStyle: labelStyle ?? this.labelStyle,
      unselectedLabelStyle: unselectedLabelStyle ?? this.unselectedLabelStyle,
    );
  }

  @override
  ThemeExtension<TabBarStyle> lerp(
          ThemeExtension<TabBarStyle>? other, double t) =>
      this;
}
