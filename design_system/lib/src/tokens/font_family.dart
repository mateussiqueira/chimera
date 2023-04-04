import '../../design_system.dart';

class FontFamily extends ThemeExtension<FontFamily> {
  const FontFamily({
    required this.textFamilyName,
    required this.displayFamilyName,
  });

  final String textFamilyName;
  final String displayFamilyName;

  static FontFamily light = FontFamily(
    displayFamilyName: Fonts.krub.name,
    textFamilyName: Fonts.inter.name,
  );

  @override
  ThemeExtension<FontFamily> copyWith({
    String? textFamilyName,
    String? displayFamilyName,
  }) =>
      FontFamily(
        textFamilyName: textFamilyName ?? this.textFamilyName,
        displayFamilyName: displayFamilyName ?? this.displayFamilyName,
      );

  @override
  ThemeExtension<FontFamily> lerp(
          ThemeExtension<FontFamily>? other, double t) =>
      this;
}
