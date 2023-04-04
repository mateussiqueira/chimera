import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../ui/mixins/login_social_buttons_mixin.dart';

mixin NotifierLoginSocialButtonMixin implements LoginSocialButtonsMixin {
  @override
  bool isGoogleEnabled() => true;

  @override
  bool isAppleEnabled() => Platform.isIOS && true;

  @override
  bool shouldShowLoginSocialButtons() => isGoogleEnabled() || isAppleEnabled();

  @override
  Future<bool> loginWithGoogle() async {
    try {
      LoadingWidget.show();
      final credentials = await googleAuthentication.auth();
      final account = await remoteSocialAuthentication.auth(credentials);
      await remoteInitUser.initUser(account: account);
      Marcopolo().emit(UserLoggedInEvent());
      return true;
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    } finally {
      LoadingWidget.hide();
    }
    return false;
  }

  @override
  Future<bool> loginWithApple() async {
    try {
      LoadingWidget.show();
      final credentials = await appleAuthentication.auth();
      final account = await remoteSocialAuthentication.auth(credentials);
      await remoteInitUser.initUser(account: account);
      Marcopolo().emit(UserLoggedInEvent());
      return true;
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    } finally {
      LoadingWidget.hide();
    }

    return false;
  }
}
