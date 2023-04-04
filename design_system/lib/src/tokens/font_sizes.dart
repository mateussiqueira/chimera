import 'dart:io';

enum FontSizes {
  textXs(13),
  textSm(14),
  textMd(16),
  textLg(18),
  textXl(20),
  displayMd(16),
  displayLg(18),
  displayXxl(22);

  const FontSizes(this.size);
  final double size;

  double get value {
    // return size;
    return Platform.isAndroid ? size - 2 : size;
  }
}
