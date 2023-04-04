import 'dart:async';

import '../../../design_system.dart';

mixin UIBottomSheetMixin {
  Future<T?> showModalBS<T>({
    required BuildContext context,
    required Widget body,
    bool transparent = false,
    bool rounded = false,
    bool hasPadding = true,
    double? minimumBottomPadding,
    BoxDecoration? decoration,
    bool isDismissible = true,
  }) async {
    final completer = Completer<T?>();
    final result = await showModalBottomSheet<T?>(
      isDismissible: isDismissible,
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      elevation: Sizes.size00,
      barrierColor:
          transparent ? Colors.transparent : Colors.black.withAlpha(204),
      backgroundColor: background(context),
      shape: rounded
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Sizes.size24),
                topRight: Radius.circular(Sizes.size24),
              ),
            )
          : null,
      builder: (context) {
        return SafeArea(
          minimum: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom +
                (minimumBottomPadding ?? Sizes.size16),
          ),
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              decoration: decoration,
              padding: hasPadding
                  ? const EdgeInsets.all(Sizes.size16).copyWith(
                      bottom: 0,
                    )
                  : EdgeInsets.zero,
              child: body,
            ),
          ),
        );
      },
    );
    completer.complete(result);
    return completer.future;
  }

  Color? background(BuildContext context) {
    BaseModuleStyle? resolvedStyle = primaryModuleStyle;
    return resolvedStyle.backgroundModuleSecondaryColor(context);
  }
}
