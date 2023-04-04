import 'package:authentication/src/ui/mixins/email_input_presenter_mixin.dart';
import 'package:authentication/src/ui/mixins/form_validation_presenter_mixin.dart';
import 'package:design_system/design_system.dart';

abstract class ResetPasswordAskPresenter extends UpdatePresenter
    with EmailInputPresenterMixin, FormValidationPresenterMixin {
  Future<bool> ask(BuildContext context);
}
