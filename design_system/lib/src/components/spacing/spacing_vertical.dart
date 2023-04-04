import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/material.dart';

class SpacingVertical extends StatelessWidget {
  const SpacingVertical.spacing04({super.key}) : _value = Spacings.spacing04;
  const SpacingVertical.spacing08({super.key}) : _value = Spacings.spacing08;
  const SpacingVertical.spacing12({super.key}) : _value = Spacings.spacing12;
  const SpacingVertical.spacing16({super.key}) : _value = Spacings.spacing16;
  const SpacingVertical.spacing20({super.key}) : _value = Spacings.spacing20;
  const SpacingVertical.spacing24({super.key}) : _value = Spacings.spacing24;
  const SpacingVertical.spacing32({super.key}) : _value = Spacings.spacing32;
  const SpacingVertical.spacing40({super.key}) : _value = Spacings.spacing40;
  const SpacingVertical.spacing48({super.key}) : _value = Spacings.spacing48;
  const SpacingVertical.spacing64({super.key}) : _value = Spacings.spacing64;
  const SpacingVertical.spacing80({super.key}) : _value = Spacings.spacing80;
  const SpacingVertical.spacing92({super.key}) : _value = Spacings.spacing92;
  const SpacingVertical.spacing128({super.key}) : _value = Spacings.spacing128;
  const SpacingVertical.spacing160({super.key}) : _value = Spacings.spacing160;
  const SpacingVertical.spacing192({super.key}) : _value = Spacings.spacing192;
  const SpacingVertical.spacing224({super.key}) : _value = Spacings.spacing224;
  const SpacingVertical.spacing256({super.key}) : _value = Spacings.spacing256;

  final double _value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _value,
    );
  }
}
