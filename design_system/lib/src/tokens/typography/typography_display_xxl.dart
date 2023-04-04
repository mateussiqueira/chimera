import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/material.dart';
import 'package:design_system/src/styles/fonts/fonts.dart';

class TypographyDisplayXxl {
  static TextStyle normal(BuildContext context) => TextStyle(
        fontFamily: fontFamilyStyle.displayFamilyName(context),
        fontSize: FontSizes.displayXxl.value,
        fontWeight: FontWeights.regular,
        height: LineHeights.displayXxl.getValue(FontSizes.displayXxl.value),
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
