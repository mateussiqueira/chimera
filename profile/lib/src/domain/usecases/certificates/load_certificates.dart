import 'package:certificates/certificates.dart';

abstract class LoadCertificates {
  Future<List<CertificateEntity>> load();
}
