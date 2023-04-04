import 'package:core/core.dart';
import 'package:design_system/design_system.dart';

import 'navbar_item.dart';

class NavbarController {
  NavbarController({
    required this.navigatorKey,
    required this.microApps,
    required this.items,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final List<MicroApp> microApps;
  final List<NavbarItem> items;

  ValueNotifier<int> currentIndex = ValueNotifier(0);

  void navigateTo(int index) {
    final item = items[index];
    navigatorKey.currentState?.pushReplacementNamed(item.route);
    currentIndex.value = items.indexOf(item);
  }

  void setCurrentIndex(String route) {
    final index = items.indexWhere((item) => item.route == route);
    if (index > -1) {
      currentIndex.value = index;
    }
  }

  List<BottomNavigationBarItem> get navigationItems {
    return [
      for (var item in items)
        BottomNavigationBarItem(
          icon: item == items[currentIndex.value]
              ? item.icon
              : item.unselectedIcon,
          label: item.title,
        ),
    ];
  }
}
