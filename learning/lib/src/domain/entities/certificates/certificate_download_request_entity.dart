import 'package:dependencies/dependencies.dart';

class CertificateDownloadRequestEntity extends Equatable {
  const CertificateDownloadRequestEntity({
    required this.id,
    required this.type,
  });

  final String id;
  final String type;

  @override
  List get props => [id, type];
}
