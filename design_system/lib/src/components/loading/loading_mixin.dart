import 'dart:io';

import 'loading_widget.dart';

mixin LoadingMixin {
  Future<void> showLoading() async {
    if (!Platform.environment.containsKey('FLUTTER_TEST')) {
      LoadingWidget.show();
    }
  }

  Future<void> hideLoading() async {
    if (!Platform.environment.containsKey('FLUTTER_TEST')) {
      LoadingWidget.hide();
    }
  }
}
