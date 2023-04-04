import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

abstract class MicroApp {
  MicroApp({
    required this.name,
    required this.routes,
    transitionType = TransitionType.defaultTransition,
  });

  final String name;
  final List<ChildRoute> routes;
  void Function(Event event) get listener;
}
