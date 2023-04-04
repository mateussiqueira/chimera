import 'package:design_system/design_system.dart';

class NavbarItemModel {
  static const double defaultSize = 24;

  static Widget icon(Icons icon, Color color) =>
      icon.iconCopyWith(size: defaultSize, color: color);

  static Widget image(Images image, {Color? color}) => ImageWidget(
        image: image,
        size: defaultSize,
        color: color,
      );
}
