import 'package:design_system/src/styles/fonts/fonts.dart';
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/material.dart';

class TypographyTextXs {
  static TextStyle normal(BuildContext context) => TextStyle(
        fontFamily: fontFamilyStyle.textFamilyName(context),
        fontSize: FontSizes.textXs.value,
        fontWeight: FontWeights.regular,
        height: LineHeights.textXs.getValue(FontSizes.textXs.value),
        leadingDistribution: TextLeadingDistribution.even,
        package: 'design_system',
      );

  static TextStyle medium(BuildContext context) => normal(context).copyWith(
        fontWeight: FontWeights.medium,
      );

  static TextStyle semiBold(BuildContext context) => normal(context).copyWith(
        fontWeight: FontWeights.semiBold,
      );

  static TextStyle bold(BuildContext context) => normal(context).copyWith(
        fontWeight: FontWeights.bold,
      );
}
