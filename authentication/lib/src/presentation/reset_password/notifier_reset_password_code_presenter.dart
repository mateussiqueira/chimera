import 'dart:async';

import 'package:authentication/src/domain/usecases/usecases.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../data/data.dart';
import '../../ui/pages/reset_password/reset_password.dart';

class NotifierResetPasswordCodePresenter extends NotifierUpdatePresenter
    implements ResetPasswordCodePresenter {
  NotifierResetPasswordCodePresenter({
    required this.remoteResetPasswordAsk,
    required this.remoteResetPasswordValidadeCode,
  }) {
    _startTimer();
  }

  final ResetPasswordAsk remoteResetPasswordAsk;
  final ResetPasswordValidateCode remoteResetPasswordValidadeCode;

  String? _code;
  static Timer? countdownTimer;
  static const defaultTimeToResendEmailInSeconds = 30;
  static int seconds = defaultTimeToResendEmailInSeconds;

  @override
  String? get code => _code;

  @override
  void setCode(String? code) {
    _code = code;
    update();
  }

  @override
  bool get isFormValidated => (_code?.length ?? 0) >= 6;

  void _startTimer() {
    countdownTimer ??=
        Timer.periodic(const Duration(seconds: 1), (_) => _setCountDown());
  }

  void _setCountDown() {
    seconds--;
    if (seconds <= 0) {
      countdownTimer?.cancel();
      countdownTimer = null;
      seconds = defaultTimeToResendEmailInSeconds;
    }
    update();
  }

  @override
  bool shouldShowResendEmail() => countdownTimer == null;

  @override
  String get secondsRemaining => secondsFormatted();

  String secondsFormatted() => seconds >= 10 ? '$seconds' : '0$seconds';

  @override
  Future<bool> resendEmail(String email, BuildContext context) async {
    bool success = false;
    try {
      LoadingWidget.show();
      success = await remoteResetPasswordAsk.ask(email: email);
      if (!success) {
        ToastWidget.showGenericError();
      }
      _startTimer();
    } on ResetNonRegisteredError catch (e) {
      _startTimer();
      ToastWidget.showError(message: e.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } catch (_) {
      _startTimer();
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
    return success;
  }

  @override
  Future<bool> validateCode(String email, BuildContext context) async {
    if (!isFormValidated) {
      return false;
    }
    bool success = false;
    try {
      LoadingWidget.show();
      success = await remoteResetPasswordValidadeCode.validateCode(
          email: email, code: _code ?? '');
      if (!success) {
        ToastWidget.showError(message: R.string.invalidCode);
      }
    } on ResetInvalidCodeError catch (e) {
      ToastWidget.showError(message: e.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
    return success;
  }
}
