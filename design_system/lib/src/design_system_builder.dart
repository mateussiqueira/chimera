import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class DesignSystemBuilder {
  static TransitionBuilder init() {
    return LoadingWidget.init(
      builder: (context, child) {
        appContext = context;
        return StyledToast(
          locale: Localizations.localeOf(context),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: child ?? const EmptyWidget(),
          ),
        );
      },
    );
  }
}
