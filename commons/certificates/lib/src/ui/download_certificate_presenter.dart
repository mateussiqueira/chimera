import 'package:certificates/certificates.dart';
import 'package:design_system/design_system.dart';

abstract class DownloadCertificatePresenter extends UpdatePresenter {
  Future<void> initCertificate(CertificateEntity certificate);
  Future<void> download(CertificateFileType type);
}
