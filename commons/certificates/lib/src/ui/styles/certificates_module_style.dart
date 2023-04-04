import 'package:design_system/design_system.dart';

abstract class CertificatesStyle
    with PrimaryModuleStyleMixin, TertiaryModuleStyleMixin {}

class CertificatesModuleStyle extends CertificatesStyle {
  CertificatesModuleStyle._privateConstructor();

  static final CertificatesModuleStyle instance =
      CertificatesModuleStyle._privateConstructor();
}

CertificatesModuleStyle get moduleStyle => CertificatesModuleStyle.instance;
