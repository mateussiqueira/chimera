import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

abstract class BaseApp {
  abstract List<ChildRoute> baseRoutes;
  abstract List<Alligator> dependencies;
  abstract ConfigurationManager configManager;
  abstract EventBus listener;
  abstract List<MicroApp> microApps;
  abstract List<Translation> translations;

  final List<ChildRoute> routes = [];

  void registerEvents() {
    if (microApps.isNotEmpty) {
      listener.listener().onData((data) {
        for (MicroApp microApp in microApps) {
          microApp.listener(data);
        }
      });
    }
  }

  void registerRouters() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        routes.addAll(microApp.routes);
      }
    }
  }

  void registerTranslations() {
    if (translations.isNotEmpty) {
      for (Translation translation in translations) {
        R.init(translation);
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final routerName = settings.name;
    final navigateTo = routes
        .firstWhereOrNull(
          (element) => element.name == routerName,
        )
        ?.builder;

    if (navigateTo == null) return null;

    for (final currentRoute in routes) {
      if (settings.name == currentRoute.name) {
        return RouteGenerator.onGenerateRoute(
          builder: currentRoute.builder,
          navigateTo: navigateTo,
          settings: settings,
          arguments: settings.arguments,
          transitionType: currentRoute.transitionType,
          transitionDuration: currentRoute.transitionDuration,
        );
      }
    }
    return null;
  }
}
