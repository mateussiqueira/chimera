import 'package:design_system/design_system.dart';

class NavbarItem {
  NavbarItem({
    required this.title,
    required this.route,
    required this.icon,
    required this.unselectedIcon,
  });

  final String title;
  final String route;
  final Widget icon;
  final Widget unselectedIcon;
}
