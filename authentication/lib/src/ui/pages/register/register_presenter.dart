import 'package:authentication/src/ui/mixins/email_input_presenter_mixin.dart';
import 'package:authentication/src/ui/mixins/form_validation_presenter_mixin.dart';
import 'package:authentication/src/ui/mixins/password_input_presenter_mixin.dart';
import 'package:design_system/design_system.dart';
import '../../mixins/login_social_buttons_mixin.dart';

abstract class RegisterPresenter extends UpdatePresenter
    with
        EmailInputPresenterMixin,
        PasswordInputPresenterMixin,
        FormValidationPresenterMixin,
        LoginSocialButtonsMixin {
  String? get firstName;
  void setFirstName(String? firstName);
  void validateFirstName();
  String? get firstNameErrorText;

  String? get surname;
  void setSurname(String? surname);
  void validateSurname();
  String? get surnameErrorText;

  void clearFields();
  Future<bool> register(BuildContext context);
}
