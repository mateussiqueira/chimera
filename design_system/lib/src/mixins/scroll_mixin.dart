import 'package:flutter/cupertino.dart';

mixin ScrollMixin {
  static const kScrollDuration = Duration(milliseconds: 500);

  Future<void> scrollListToStart({
    BuildContext? context,
    ScrollController? controller,
    bool animate = true,
  }) async {
    ScrollController? scrollController = controller;
    assert(
      (context != null || controller != null),
      'BuildContext or ScrollController must be provided',
    );
    if (context != null) {
      scrollController = PrimaryScrollController.of(context);
    }
    if (scrollController?.hasClients ?? false) {
      if (animate) {
        return scrollController?.animateTo(
          0,
          duration: kScrollDuration,
          curve: Curves.easeIn,
        );
      } else {
        return scrollController?.jumpTo(0);
      }
    }
  }

  Future<void> scrollListToEnd({
    BuildContext? context,
    ScrollController? controller,
    bool animate = true,
  }) async {
    ScrollController? scrollController = controller;
    if (context != null) {
      scrollController = PrimaryScrollController.of(context);
    }
    if (scrollController?.hasClients ?? false) {
      final double? maxScroll = scrollController?.position.maxScrollExtent;
      if (maxScroll != null) {
        if (animate) {
          return scrollController?.animateTo(
            maxScroll,
            duration: kScrollDuration,
            curve: Curves.easeIn,
          );
        } else {
          return scrollController?.jumpTo(maxScroll);
        }
      }
    }
  }
}
