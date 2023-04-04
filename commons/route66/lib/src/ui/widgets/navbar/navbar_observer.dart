import 'package:design_system/design_system.dart';

import 'navbar_controller.dart';

class NavbarObserver extends NavigatorObserver {
  NavbarObserver({
    required this.controller,
  });

  final NavbarController controller;

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final routeName = newRoute?.settings.name;
    if (routeName != null) {
      controller.setCurrentIndex(routeName);
    }
  }
}
