import 'package:design_system/design_system.dart';

class FontFamilyStyle {
  FontFamilyStyle._();
  factory FontFamilyStyle() => _instance ??= FontFamilyStyle._();
  static FontFamilyStyle? _instance;

  static FontFamily? themeExtension(BuildContext context) =>
      context.resolveStyle<FontFamily>();

  String? textFamilyName(BuildContext context) =>
      themeExtension(context)?.textFamilyName;

  String? displayFamilyName(BuildContext context) =>
      themeExtension(context)?.displayFamilyName;
}

FontFamilyStyle get fontFamilyStyle => FontFamilyStyle();
