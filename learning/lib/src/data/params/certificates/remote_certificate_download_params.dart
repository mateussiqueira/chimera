import 'package:learning/src/domain/domain.dart';

class RemoteCertificateDownloadParams extends CertificateDownloadParams {
  const RemoteCertificateDownloadParams({required super.type});

  Map<String, dynamic> get toBodyJson {
    return <String, dynamic>{
      'type': type,
    };
  }
}
