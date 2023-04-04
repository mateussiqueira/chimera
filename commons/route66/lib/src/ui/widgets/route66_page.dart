import 'package:core/core.dart';

import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import 'navbar/navbar_observer.dart';

final GlobalKey<NavigatorState> internalNavigationKey = GlobalKey();

class Route66Page extends StatelessWidget {
  Route66Page({
    super.key,
    required this.microApps,
    required this.initialRoute,
    required this.items,
  }) : _navbarController = NavbarController(
          navigatorKey: internalNavigationKey,
          microApps: microApps,
          items: items,
        );

  final List<MicroApp> microApps;
  final String initialRoute;
  final List<NavbarItem> items;

  final NavbarController _navbarController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InternalNavigationWidget(
        microApps: microApps,
        initialRoute: initialRoute,
        navigatorKey: internalNavigationKey,
        observers: [
          NavbarObserver(
            controller: _navbarController,
          ),
        ],
      ),
      bottomNavigationBar: NavbarWidget(
        controller: _navbarController,
      ),
    );
  }
}
