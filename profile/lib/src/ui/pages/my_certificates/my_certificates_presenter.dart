import 'package:flutter/foundation.dart';
import 'package:certificates/certificates.dart';

import 'helpers/helpers.dart';

abstract class MyCertificatesPresenter implements Listenable {
  Future<void> load();
  List<CertificateEntity> get certificates;
  CertificatesStatus get hasCertificates;
  Future<void> nextPage();
}
