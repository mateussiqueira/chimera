import 'package:dependencies/dependencies.dart';
import 'package:iterable/iterable_method_channel.dart';

import '../data/data.dart';
import '../domain/domain.dart';
import '../infra/infra.dart';
import '../presentation/presentation.dart';
import '../ui/ui.dart';

class AuthenticationModule {
  static Alligator initialize() {
    var alligator = Alligator();

    alligator.register<SaveAccount>(
      () => LocalSaveAccount(
        storage: alligator.get<SecureCacheStorage>(),
      ),
    );

    alligator.register<SaveUser>(
      () => LocalSaveUser(
        storage: alligator.get<SecureCacheStorage>(),
      ),
    );

    alligator.register<LoadUser>(
      () => LocalLoadUser(
        storage: alligator.get<SecureCacheStorage>(),
      ),
    );

    alligator.register<InitUser>(
      () => RemoteInitUser(
        iterableChannel: alligator.get<MethodChannelIterable>(),
        localSaveAccount: alligator.get<SaveAccount>(),
        remoteLoadUser: alligator.get<RemoteLoadUser>(),
        localSaveUser: alligator.get<SaveUser>(),
      ),
    );

    alligator.register<LoadAccount>(
      () => LocalLoadAccount(
        storage: alligator.get<SecureCacheStorage>(),
      ),
    );

    alligator.register<Token>(
      () => TokenAdapter(),
    );

    alligator.register<RemoveAccount>(
      () => LocalRemoveAccount(
        storage: alligator.get<SecureCacheStorage>(),
      ),
    );

    alligator.register<RemoveUser>(
      () => LocalRemoveUser(
        storage: alligator.get<SecureCacheStorage>(),
      ),
    );

    alligator.register<RefreshToken>(
      () => RemoteRefreshToken(
        httpClient: alligator.get<HttpClient>(),
        initUser: alligator.get<InitUser>(),
        localLoadAccount: alligator.get<LoadAccount>(),
        url: EndPointConfiguration.url(Endpoint.refreshToken.endPoint),
      ),
    );

    alligator.register<UserIsLoggedIn>(
      () => LocalUserIsLoggedIn(
        loadAccount: alligator.get<LoadAccount>(),
        tokenAdapter: alligator.get<Token>(),
      ),
    );

    alligator.register<LoadUser>(
      () => RemoteLoadUser(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(Endpoint.myUser.endPoint),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<Authentication>(
      () => RemoteAuthentication(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(Endpoint.login.endPoint),
      ),
    );

    alligator.register<SocialAuthentication>(
      () => RemoteSocialAuthentication(
        client: alligator.get<HttpClient>(),
      ),
    );

    alligator.register<LoginPresenter>(
      () => NotifierLoginPresenter(
        remoteAuthentication: alligator.get<Authentication>(),
        localSaveAccount: alligator.get<SaveAccount>(),
        googleAuthentication:
            alligator.get<GoogleSocialAuthenticationAdapter>(),
        appleAuthentication: alligator.get<AppleSocialAuthenticationAdapter>(),
        remoteSocialAuthentication: alligator.get<RemoteSocialAuthentication>(),
        remoteInitUser: alligator.get<InitUser>(),
      ),
    );

    alligator.register<AddAccount>(
      () => RemoteAddAccount(
        httpClient: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(Endpoint.registerUser.endPoint),
      ),
    );

    alligator.register<SocialAuthenticationAdapter>(
      () => GoogleSocialAuthenticationAdapter(),
    );

    alligator.register<SocialAuthenticationAdapter>(
      () => AppleSocialAuthenticationAdapter(),
    );

    alligator.register<RegisterPresenter>(
      () => NotifierRegisterPresenter(
        localSaveAccount: alligator.get<SaveAccount>(),
        remoteAddAcount: alligator.get<AddAccount>(),
        remoteInitUser: alligator.get<InitUser>(),
        googleAuthentication:
            alligator.get<GoogleSocialAuthenticationAdapter>(),
        appleAuthentication: alligator.get<AppleSocialAuthenticationAdapter>(),
        remoteSocialAuthentication: alligator.get<RemoteSocialAuthentication>(),
      ),
    );

    alligator.register<ResetPasswordAsk>(
      () => RemoteResetPasswordAsk(
        httpClient: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(Endpoint.resetPasswordAsk.endPoint),
      ),
    );

    alligator.register<ResetPasswordAskPresenter>(
      () => NotifierResetPasswordAskPresenter(
        remoteResetPassword: alligator.get<ResetPasswordAsk>(),
      ),
    );

    alligator.register<ResetPasswordValidateCode>(
      () => RemoteResetPasswordValidateCode(
        httpClient: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(Endpoint.resetPasswordCheck.endPoint),
      ),
    );

    alligator.register<ResetPasswordCodePresenter>(
      () => NotifierResetPasswordCodePresenter(
        remoteResetPasswordAsk: alligator.get<ResetPasswordAsk>(),
        remoteResetPasswordValidadeCode:
            alligator.get<ResetPasswordValidateCode>(),
      ),
    );

    alligator.register<ResetPasswordConfirm>(
      () => RemoteResetPasswordConfirm(
        httpClient: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url(Endpoint.resetPasswordConfirm.endPoint),
      ),
    );

    alligator.register<ResetPasswordConfirmPresenter>(
      () => NotifierResetPasswordConfirmPresenter(
        remoteResetPassword: alligator.get<ResetPasswordConfirm>(),
      ),
    );

    return alligator;
  }
}
