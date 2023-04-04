enum Animations {
  assessmentSuccess(
    'anim-assessment-success',
    fileExtension: 'json',
    alt: null,
    package: 'design_system',
  ),
  splashLoading('anim-splash-loading');

  const Animations(
    this.fileName, {
    this.fileExtension = "json",
    this.package = 'design_system',
    this.alt,
  });

  final String fileName;
  final String fileExtension;
  final String package;
  final String? alt;

  AnimationInfo get animationInfo {
    return AnimationInfo(
      fileName: fileName,
      fileExtension: fileExtension,
      package: package,
      alt: alt,
    );
  }
}

class AnimationInfo {
  AnimationInfo({
    required this.fileName,
    this.fileExtension = 'json',
    this.package,
    this.alt,
  });
  final String fileName;
  final String fileExtension;
  final String? package;
  final String? alt;

  String get filePath => 'assets/animations/$fileName.$fileExtension';
}
