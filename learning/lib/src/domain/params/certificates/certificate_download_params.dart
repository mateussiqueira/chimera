import 'package:dependencies/dependencies.dart';

class CertificateDownloadParams extends Equatable {
  const CertificateDownloadParams({
    required this.type,
  });

  final String type;

  @override
  List<Object?> get props => [type];
}
