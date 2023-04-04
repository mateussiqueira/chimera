import 'package:design_system/design_system.dart';

abstract class BackgroundBaseColorStyle<T extends ThemeExtension<T>>
    extends ThemeExtension<T> {
  const BackgroundBaseColorStyle({
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.quaternaryColor,
  });

  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? tertiaryColor;
  final Color? quaternaryColor;
}
