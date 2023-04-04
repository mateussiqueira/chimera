import 'package:design_system/design_system.dart';

class CertificateStyle extends ThemeExtension<CertificateStyle> {
  const CertificateStyle({
    this.borderColor,
  });

  final Color? borderColor;

  @override
  CertificateStyle copyWith({
    Color? borderColor,
  }) {
    return CertificateStyle(borderColor: borderColor ?? this.borderColor);
  }

  @override
  ThemeExtension<CertificateStyle> lerp(
    ThemeExtension<CertificateStyle>? other,
    double t,
  ) =>
      this;
}
