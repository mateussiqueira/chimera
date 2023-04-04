import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/material.dart';

class SpacingHorizontal extends StatelessWidget {
  const SpacingHorizontal.spacing04({super.key}) : _value = Spacings.spacing04;
  const SpacingHorizontal.spacing08({super.key}) : _value = Spacings.spacing08;
  const SpacingHorizontal.spacing12({super.key}) : _value = Spacings.spacing12;
  const SpacingHorizontal.spacing16({super.key}) : _value = Spacings.spacing16;
  const SpacingHorizontal.spacing20({super.key}) : _value = Spacings.spacing20;
  const SpacingHorizontal.spacing24({super.key}) : _value = Spacings.spacing24;
  const SpacingHorizontal.spacing32({super.key}) : _value = Spacings.spacing32;
  const SpacingHorizontal.spacing40({super.key}) : _value = Spacings.spacing40;
  const SpacingHorizontal.spacing48({super.key}) : _value = Spacings.spacing48;
  const SpacingHorizontal.spacing64({super.key}) : _value = Spacings.spacing64;
  const SpacingHorizontal.spacing80({super.key}) : _value = Spacings.spacing80;
  const SpacingHorizontal.spacing92({super.key}) : _value = Spacings.spacing92;
  const SpacingHorizontal.spacing128({super.key})
      : _value = Spacings.spacing128;
  const SpacingHorizontal.spacing160({super.key})
      : _value = Spacings.spacing160;
  const SpacingHorizontal.spacing192({super.key})
      : _value = Spacings.spacing192;
  const SpacingHorizontal.spacing224({super.key})
      : _value = Spacings.spacing224;
  const SpacingHorizontal.spacing256({super.key})
      : _value = Spacings.spacing256;

  final double _value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _value,
    );
  }
}
