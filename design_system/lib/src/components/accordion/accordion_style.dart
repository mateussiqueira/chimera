import 'package:design_system/design_system.dart';

class AccordionStyle extends ThemeExtension<AccordionStyle> {
  AccordionStyle({
    this.backgroundColor,
    this.backgroundRowSelectedColor,
    required this.boxShadow,
    this.contentBackgroundColor,
    required this.chevronIcon,
    this.chevronIconColor,
    required this.contentRadius,
    required this.headerExpandedRadius,
    required this.headerRadius,
  });

  final Color? backgroundColor;
  final Color? backgroundRowSelectedColor;
  final List<BoxShadow>? boxShadow;
  final Color? contentBackgroundColor;
  final Icons? chevronIcon;
  final Color? chevronIconColor;
  final BorderRadiusGeometry? contentRadius;
  final BorderRadius? headerExpandedRadius;
  final BorderRadius? headerRadius;

  static final AccordionStyle light = AccordionStyle(
    boxShadow: Shadows.shadowSm,
    chevronIcon: Icons.chevronDown,
    contentRadius: const BorderRadius.vertical(
      bottom: Radius.circular(
        Sizes.size16,
      ),
    ),
    headerExpandedRadius: const BorderRadius.vertical(
      top: Radius.circular(
        Sizes.size16,
      ),
    ),
    headerRadius: const BorderRadius.all(
      Radius.circular(
        Sizes.size16,
      ),
    ),
  );

  @override
  ThemeExtension<AccordionStyle> lerp(
    ThemeExtension<AccordionStyle>? other,
    double t,
  ) {
    return this;
  }

  @override
  AccordionStyle copyWith({
    Color? backgroundColor,
    Color? backgroundRowSelectedColor,
    List<BoxShadow>? boxShadow,
    Color? contentBackgroundColor,
    Icons? chevronIcon,
    Color? chevronIconColor,
    BorderRadiusGeometry? contentRadius,
    BorderRadius? headerExpandedRadius,
    BorderRadius? headerRadius,
  }) {
    return AccordionStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundRowSelectedColor:
          backgroundRowSelectedColor ?? this.backgroundRowSelectedColor,
      boxShadow: boxShadow ?? this.boxShadow,
      contentBackgroundColor:
          contentBackgroundColor ?? this.contentBackgroundColor,
      chevronIcon: chevronIcon ?? this.chevronIcon,
      chevronIconColor: chevronIconColor ?? this.chevronIconColor,
      contentRadius: contentRadius ?? this.contentRadius,
      headerRadius: headerRadius ?? this.headerRadius,
      headerExpandedRadius: headerExpandedRadius ?? this.headerExpandedRadius,
    );
  }
}
