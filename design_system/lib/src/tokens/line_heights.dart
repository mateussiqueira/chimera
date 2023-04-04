import 'package:design_system/src/tokens/font_sizes.dart';

enum LineHeights {
  textXs(18),
  textSm(20),
  textMd(24),
  textLg(24),
  textXl(30),
  displayMd(24),
  displayLg(24),
  displayXl(72),
  displayXxl(32);

  const LineHeights(this._value);

  final double _value;

  double getValue(double? fontSize) {
    return _value / (fontSize ?? FontSizes.textSm.value);
  }
}
