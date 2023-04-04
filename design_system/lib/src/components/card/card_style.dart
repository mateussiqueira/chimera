import 'package:design_system/design_system.dart';

class CardStyle extends ThemeExtension<CardStyle> {
  const CardStyle({
    this.backgroundColor,
    required this.borderRadius,
    required this.padding,
    required this.shadow,
  });

  final Color? backgroundColor;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final List<BoxShadow> shadow;

  static CardStyle light = CardStyle(
    borderRadius: BorderRadius.circular(
      Sizes.size16,
    ),
    padding: const EdgeInsets.fromLTRB(
      Sizes.size16,
      Sizes.size00,
      Sizes.size16,
      Sizes.size12,
    ),
    shadow: Shadows.shadowSm,
  );

  @override
  CardStyle copyWith({
    Color? backgroundColor,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    List<BoxShadow>? shadow,
  }) {
    return CardStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  ThemeExtension<CardStyle> lerp(
    ThemeExtension<CardStyle>? other,
    double t,
  ) {
    return this;
  }
}
