import '../../design_system.dart';

class DesignSystemThemes {
  static ThemeData light = ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      AnimationsStyle.light,
      BackgroundPrimaryStyle.light,
      BackgroundSecondaryStyle.light,
      BackgroundTertiaryStyle.light,
      BackgroundQuaternaryStyle.light,
      BackgroundDangerStyle.light,
      BackgroundSuccessStyle.light,
      FontFamily.light,
      ImagesStyle.light,
      ToastStyle.light,
      TextPrimaryStyle.light,
      TextSecondaryStyle.light,
      TextTertiaryStyle.light,
      TextQuaternaryStyle.light,
      TextDangerStyle.light,
      TextSuccessStyle.light,
    ].toList(),
  );
}

extension CopyExtensionsExtension on ThemeData {
  ThemeData copyWithExtension({
    required List<ThemeExtension<dynamic>> extensions,
  }) {
    final newExtensions = {...this.extensions};
    for (final extension in extensions) {
      if (extension is ThemeExtension) {
        newExtensions[extension.type] = extension;
      }
    }
    return copyWith(extensions: newExtensions.values);
  }
}
