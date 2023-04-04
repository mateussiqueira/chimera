import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../data/data.dart';
import '../../domain/domain.dart';
import '../../ui/pages/register/register.dart';
import '../mixins/notifier_email_input_mixin.dart';
import '../mixins/notifier_login_social_buttons_mixin.dart';
import '../mixins/notifier_password_input_mixin.dart';

class NotifierRegisterPresenter extends NotifierUpdatePresenter
    with
        NotifierEmailInputMixin,
        NotifierPasswordInputMixin,
        NotifierLoginSocialButtonMixin
    implements RegisterPresenter {
  NotifierRegisterPresenter({
    required this.localSaveAccount,
    required this.remoteInitUser,
    required this.remoteAddAcount,
    required this.googleAuthentication,
    required this.appleAuthentication,
    required this.remoteSocialAuthentication,
  }) {
    emailInputMixinListenable = this;
    passwordInputMixinListenable = this;
  }

  final AddAccount remoteAddAcount;

  String? _firstName;
  String? _firstNameErrorTxt;
  String? _surname;
  String? _surnameErrorTxt;

  @override
  String? get firstName => _firstName;

  @override
  void setFirstName(String? name) {
    _firstName = name;
    if (isFirstNameValid()) {
      validateFirstName();
    } else {
      update();
    }
  }

  @override
  void validateFirstName() {
    _firstNameErrorTxt =
        isFirstNameValid() || (_firstName?.trim().isEmpty ?? true)
            ? null
            : R.string.firstNameError;
    update();
  }

  @override
  String? get firstNameErrorText => _firstNameErrorTxt;

  @override
  String? get surname => _surname;

  @override
  void setSurname(String? surname) {
    _surname = surname;
    if (isSurnameValid()) {
      validateSurname();
    } else {
      update();
    }
  }

  @override
  String? get surnameErrorText => _surnameErrorTxt;

  @override
  void validateSurname() {
    _surnameErrorTxt = isSurnameValid() || (_surname?.trim().isEmpty ?? true)
        ? null
        : R.string.surnameError;
    update();
  }

  bool isFirstNameValid() => (_firstName?.trim().length ?? 0) > 1;

  bool isSurnameValid() => (_surname?.trim().length ?? 0) > 1;

  @override
  bool get isFormValidated =>
      isFirstNameValid() &&
      isSurnameValid() &&
      isEmailValid() &&
      isPasswordValid();

  String _getFullName() {
    return '${_firstName ?? ''} ${_surname ?? ''}'.replaceAll('  ', ' ');
  }

  @override
  void clearFields() {
    setEmail(null);
    setPassword(null);
    setFirstName(null);
    setSurname(null);
  }

  @override
  Future<bool> register(BuildContext context) async {
    if (!isFormValidated) {
      return false;
    }
    bool success = false;
    try {
      LoadingWidget.show();
      final account = await remoteAddAcount.add(
        AddAccountParams(
            email: email ?? '', password: password ?? '', name: _getFullName()),
      );
      await remoteInitUser.initUser(account: account);
      clearFields();
      success = true;
      Marcopolo().emit(UserLoggedInEvent());
    } on AlreadyExistsAccountError catch (e) {
      ToastWidget.showError(message: e.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
    return success;
  }

  @override
  SocialAuthenticationAdapter googleAuthentication;

  @override
  SocialAuthentication remoteSocialAuthentication;

  @override
  SaveAccount localSaveAccount;

  @override
  SocialAuthenticationAdapter appleAuthentication;

  @override
  InitUser remoteInitUser;
}
