enum Images {
  appbarIcon(
    'header-icon',
    fileExtension: 'svg',
    alt: null,
    package: 'design_system',
  ),
  backgroundLogin('bg-login', fileExtension: 'svg'),
  backgroundRegister('bg-register', fileExtension: 'svg'),
  backgroundResetPassword('bg-reset-password', fileExtension: 'svg'),
  assessmentPlaceholder('assessment-placeholder', fileExtension: 'svg'),
  certificateBottomLeft('certificate-bottom-left', fileExtension: 'svg'),
  certificateTopRight('certificate-top-right', fileExtension: 'svg'),
  categoryBackground('category-background', fileExtension: 'png'),
  headerIcon(
    'header-icon',
    fileExtension: 'svg',
    alt: null,
    package: 'design_system',
  ),
  homeBanner(
    'home-banner',
    fileExtension: 'png',
  ),
  illustrationEmptyStateAuthentication('il-empty-state-authentication'),
  illustrationEmptyStateCourses('il-empty-state-courses'),
  illustrationEmptyStateNoConnection('il-empty-state-no-connection'),
  illustrationEmptyStateProfile('il-empty-state-profile'),
  logoIcon('logo-icon'),
  logoIconDisabled('logo-icon-disabled'),
  logoMark('logo-mark'),
  videoPlaceholder('video-placeholder', fileExtension: 'png');

  const Images(
    this.fileName, {
    this.fileExtension = "svg",
    this.package = 'design_system',
    this.alt,
  });

  final String fileName;
  final String fileExtension;
  final String package;
  final String? alt;

  ImageInfo get imageInfo {
    return ImageInfo(
      fileName: fileName,
      fileExtension: fileExtension,
      package: package,
      alt: alt,
    );
  }
}

class ImageInfo {
  ImageInfo({
    required this.fileName,
    this.fileExtension = 'svg',
    this.package,
    this.alt,
  });
  final String fileName;
  final String fileExtension;
  final String? package;
  final String? alt;

  String get filePath => 'assets/images/$fileName.$fileExtension';
}
