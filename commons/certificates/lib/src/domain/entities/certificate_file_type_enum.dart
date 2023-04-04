enum CertificateFileType {
  document('document'),
  image('image');

  final String apiText;

  const CertificateFileType(this.apiText);
}

extension CertificateFileTypeExtension on CertificateFileType {
  String get fileExtension {
    switch (this) {
      case CertificateFileType.document:
        return '.pdf';
      case CertificateFileType.image:
        return '.png';
    }
  }
}
