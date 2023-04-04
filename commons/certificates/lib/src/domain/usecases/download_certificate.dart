import '../../../certificates.dart';

abstract class DownloadCertificate {
  Future<String> download(
      {required String id, required CertificateFileType type});
}
