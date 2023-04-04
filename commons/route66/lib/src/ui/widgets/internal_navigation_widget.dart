import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class InternalNavigationWidget extends StatelessWidget {
  const InternalNavigationWidget({
    super.key,
    required this.navigatorKey,
    required this.microApps,
    required this.initialRoute,
    this.observers,
  });

  final List<MicroApp> microApps;
  final String initialRoute;
  final GlobalKey<NavigatorState> navigatorKey;
  final List<NavigatorObserver>? observers;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Navigator(
        initialRoute: initialRoute,
        key: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          final routeName = settings.name;
          final routes = microApps.expand((app) => app.routes).toList();
          final navigateTo = routes.firstWhereOrNull(
            (element) => element.name == routeName,
          );

          if (navigateTo != null) {
            return RouteGenerator.onGenerateRoute(
              builder: navigateTo.builder,
              navigateTo: navigateTo.builder,
              settings: settings,
              arguments: settings.arguments,
              transitionType: navigateTo.transitionType,
            );
          }

          return null;
        },
        observers: observers ?? [],
      ),
    );
  }
}
