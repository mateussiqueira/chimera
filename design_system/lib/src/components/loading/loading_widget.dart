import 'package:design_system/design_system.dart';
import 'loading_content_widget.dart';

class LoadingWidget with KeyboardMixin {
  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    EasyLoading.instance.radius = LoadingStyle.light.contentRadius;
    EasyLoading.instance.contentPadding = const EdgeInsets.all(0);
    EasyLoading.instance.indicatorWidget = const LoadingContentWidget();

    setLoadingInteraction(false);

    return EasyLoading.init(builder: builder);
  }

  static void setLoadingInteraction(bool allowInteraction) {
    if (allowInteraction) {
      EasyLoading.instance.maskType = EasyLoadingMaskType.none;
    } else {
      EasyLoading.instance.maskType = EasyLoadingMaskType.clear;
    }
  }

  static void show() {
    KeyboardMixin.hideKeyboard();
    EasyLoading.show();
  }

  static void hide() => EasyLoading.dismiss();
}
