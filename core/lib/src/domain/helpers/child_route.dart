import 'package:core/core.dart';

class ChildRoute {
  ChildRoute({
    required this.name,
    required this.builder,
    this.transitionType,
    this.transitionDuration,
  });

  String name;
  WidgetBuilderArgs builder;
  TransitionType? transitionType;
  Duration? transitionDuration;
}
