import '../../../design_system.dart';

class IconWaveStyle extends ThemeExtension<IconWaveStyle> {
  const IconWaveStyle({
    this.dangerIconColor,
    this.dangerInnerCircleColor,
    this.dangerOuterCicleColor,
    this.infoIconColor,
    this.infoInnerCircleColor,
    this.infoOuterCicleColor,
  });

  final Color? dangerIconColor;
  final Color? dangerInnerCircleColor;
  final Color? dangerOuterCicleColor;

  final Color? infoIconColor;
  final Color? infoInnerCircleColor;
  final Color? infoOuterCicleColor;

  @override
  ThemeExtension<IconWaveStyle> copyWith({
    Color? dangerIconColor,
    Color? dangerInnerCircleColor,
    Color? dangerOuterCicleColor,
    Color? infoIconColor,
    Color? infoInnerCircleColor,
    Color? infoOuterCicleColor,
  }) =>
      IconWaveStyle(
        dangerIconColor: dangerIconColor ?? this.dangerIconColor,
        dangerInnerCircleColor:
            dangerInnerCircleColor ?? this.dangerInnerCircleColor,
        dangerOuterCicleColor:
            dangerOuterCicleColor ?? this.dangerOuterCicleColor,
        infoIconColor: infoIconColor ?? this.infoIconColor,
        infoInnerCircleColor: infoInnerCircleColor ?? this.infoInnerCircleColor,
        infoOuterCicleColor: infoOuterCicleColor ?? this.infoOuterCicleColor,
      );

  @override
  ThemeExtension<IconWaveStyle> lerp(
          ThemeExtension<IconWaveStyle>? other, double t) =>
      this;
}
