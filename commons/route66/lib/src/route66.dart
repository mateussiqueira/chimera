import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

class Route66 {
  static void navigate(String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  @optionalTypeArgs
  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    routeName, {
    Object? arguments,
    bool rootNavigator = true,
  }) async {
    return Navigator.of(context, rootNavigator: rootNavigator)
        .pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
    );
  }

  @optionalTypeArgs
  static Future<T?> pushNamed<T extends Object?>(
    routeName, {
    Object? arguments,
    bool rootNavigator = true,
  }) async {
    return Navigator.of(context, rootNavigator: rootNavigator).pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  static void pop<T extends Object?>({
    T? result,
    bool rootNavigator = true,
  }) {
    return Navigator.of(context, rootNavigator: rootNavigator).pop(result);
  }

  static void popToRoot({
    bool rootNavigator = true,
  }) {
    return Navigator.of(context, rootNavigator: rootNavigator).popUntil(
      (route) => route.isFirst,
    );
  }

  static BuildContext get context {
    late BuildContext overlay;
    internalNavigationKey.currentState?.overlay?.context
        .visitChildElements((element) {
      overlay = element;
    });
    return overlay;
  }
}
