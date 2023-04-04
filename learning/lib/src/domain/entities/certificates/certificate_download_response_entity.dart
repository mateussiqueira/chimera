import 'package:dependencies/dependencies.dart';

class CertificateDownloadResponseEntity extends Equatable {
  final String? url;

  @override
  List get props => [url];

  const CertificateDownloadResponseEntity(this.url);
}
