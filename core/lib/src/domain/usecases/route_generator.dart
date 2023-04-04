import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

class RouteGenerator {
  static const _defaultDuration = Duration(milliseconds: 300);

  static PageRoute onGenerateRoute({
    required WidgetBuilderArgs builder,
    required WidgetBuilderArgs navigateTo,
    required RouteSettings settings,
    TransitionType? transitionType,
    Object? arguments,
    Duration? transitionDuration,
  }) {
    switch (transitionType) {
      case TransitionType.fadeTransition:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: _pageBuilder(builder, settings),
          transitionsBuilder: (_, a, __, c) => FadeTransition(
            opacity: a,
            child: c,
          ),
          transitionDuration: transitionDuration ?? _defaultDuration,
        );
      case TransitionType.slideUpTransition:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: _pageBuilder(builder, settings),
          transitionsBuilder: (_, a, __, c) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ).animate(a),
            child: c,
          ),
          transitionDuration: transitionDuration ?? _defaultDuration,
        );
      case TransitionType.noneTransition:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: _pageBuilder(builder, settings),
          transitionDuration: transitionDuration ?? _defaultDuration,
        );
      case TransitionType.leftToRight:
        return PageRouteBuilder(
          pageBuilder: _pageBuilder(builder, settings),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              transformHitTests: false,
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: secondaryAnimation,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: child,
              ),
            );
          },
          transitionDuration: transitionDuration ?? _defaultDuration,
        );
      case TransitionType.fullscreenDialogTransition:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (context) => navigateTo.call(
            context,
            settings.arguments,
          ),
          fullscreenDialog: true,
        );
      default:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (context) => navigateTo.call(
            context,
            settings.arguments,
          ),
        );
    }
  }

  static RoutePageBuilder _pageBuilder(
    WidgetBuilderArgs builder,
    RouteSettings settings,
  ) {
    return (context, __, ___) => builder(
          context,
          settings.arguments,
        );
  }
}
