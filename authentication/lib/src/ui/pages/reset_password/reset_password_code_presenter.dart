import 'package:authentication/src/ui/mixins/form_validation_presenter_mixin.dart';
import 'package:design_system/design_system.dart';

abstract class ResetPasswordCodePresenter extends UpdatePresenter
    with FormValidationPresenterMixin {
  String? get code;
  void setCode(String? code);

  bool shouldShowResendEmail();
  String get secondsRemaining;
  Future<bool> resendEmail(String email, BuildContext context);
  Future<bool> validateCode(String email, BuildContext context);
}
