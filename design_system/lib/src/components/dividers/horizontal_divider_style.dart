import '../../../design_system.dart';

class HorizontalDividerStyle extends ThemeExtension<HorizontalDividerStyle> {
  const HorizontalDividerStyle({
    this.foregroundColor,
    this.dividerColor,
  });
  final Color? foregroundColor;
  final Color? dividerColor;

  static const HorizontalDividerStyle light = HorizontalDividerStyle();

  @override
  ThemeExtension<HorizontalDividerStyle> copyWith({
    Color? foregroundColor,
    Color? dividerColor,
  }) =>
      HorizontalDividerStyle(
        foregroundColor: foregroundColor ?? this.foregroundColor,
        dividerColor: dividerColor ?? this.dividerColor,
      );

  @override
  ThemeExtension<HorizontalDividerStyle> lerp(
          ThemeExtension<HorizontalDividerStyle>? other, double t) =>
      this;
}
