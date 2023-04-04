import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/toast/toast_content_widget.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:internationalization/internationalization.dart';

abstract class Toast {
  void show({
    required String message,
    Widget? icon,
    ToastType toastType = ToastType.error,
  });
  void showError({required String message});
  void showGenericError();
  void showNoInternet();
}

class ToastWidget {
  static void show({
    required String message,
    Widget? icon,
    ToastType toastType = ToastType.error,
  }) {
    showToastWidget(
      ToastContentWidget(
        text: message,
        icon: icon,
        toastType: toastType,
      ),
      position: StyledToastPosition.top,
      animation: StyledToastAnimation.none,
      dismissOtherToast: true,
      duration: const Duration(seconds: 4),
      reverseAnimation: StyledToastAnimation.none,
      isIgnoring: false,
    );
  }

  static Color? _defaultIconColor() =>
      appContext.resolveStyle<TextSecondaryStyle>()?.quaternaryColor;

  static void showError({required String message}) {
    show(
      message: message,
      icon: Icons.alertTriangle.iconCopyWith(
        color: _defaultIconColor(),
      ),
      toastType: ToastType.error,
    );
  }

  static void showGenericError() {
    show(
      message: R.string.genericErrorMessage,
      icon: Icons.alertTriangle.iconCopyWith(
        color: _defaultIconColor(),
      ),
      toastType: ToastType.error,
    );
  }

  static void showNoInternet() {
    show(
      message: R.string.noInternetMessage,
      icon: Icons.wifiOff.iconCopyWith(
        color: _defaultIconColor(),
      ),
      toastType: ToastType.info,
    );
  }
}
