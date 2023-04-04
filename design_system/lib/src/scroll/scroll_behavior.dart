import 'package:flutter/material.dart' as m;

class ScrollBehavior extends m.ScrollBehavior {
  const ScrollBehavior();

  @override
  m.Widget buildOverscrollIndicator(
    m.BuildContext context,
    m.Widget child,
    m.ScrollableDetails details,
  ) {
    return child;
  }

  @override
  m.ScrollPhysics getScrollPhysics(m.BuildContext context) {
    switch (getPlatform(context)) {
      default:
        return const m.ClampingScrollPhysics();
    }
  }
}
