import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

BuildContext? _appContext;

set appContext(BuildContext context) {
  _appContext = context;
}

BuildContext get appContext {
  return _appContext ?? _overlayContext;
}

BuildContext get _overlayContext {
  late BuildContext overlay;
  navigatorKey.currentState?.overlay?.context.visitChildElements((element) {
    overlay = element;
  });
  return overlay;
}
