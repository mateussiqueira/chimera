import 'package:authentication/authentication.dart' show LoadUser, UserEntity;
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:iterable/iterable_method_channel.dart';
import 'package:profile/src/ui/pages/profile/profile.dart';
import 'package:profile/src/ui/pages/profile/profile_enum.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/domain.dart';

class NotifierProfilePresenter extends ChangeNotifier
    implements ProfilePresenter {
  NotifierProfilePresenter({
    required this.removeAccount,
    required this.networkConnection,
    required this.iterable,
    required this.addRating,
    required this.localUserIsLoggedIn,
    required this.packageInfo,
    required this.localLoadUser,
  }) {
    Marcopolo().listener().onData((event) async {
      if (event is UserLoggedInEvent || event is UserLoggedOffEvent) {
        if (event is UserLoggedOffEvent) {
          await _disableIterablePush();
        }
        init();
      }
    });
  }

  final RemoveAccount removeAccount;
  final AddRating addRating;
  final UserIsLoggedIn localUserIsLoggedIn;
  final LoadUser localLoadUser;
  final PackageInfo packageInfo;
  final MethodChannelIterable iterable;
  final NetworkConnection networkConnection;

  bool? userLoggedIn;
  UserEntity? _user;
  String? appVersion;
  String? _userRating;

  List<ProfileEnum> _items = [];

  void _update() {
    notifyListeners();
  }

  @override
  Future<void> init() async {
    LoadingWidget.show();
    _user = null;
    await initAppVersion();
    try {
      Marcopolo().emit(UpdateCartItemsEvent());
      userLoggedIn = await localUserIsLoggedIn.verify();
      if (userLoggedIn == true) {
        _user = await localLoadUser.load();
      }
    } catch (_) {}
    userLoggedIn ??= false;
    _initItems(userLoggedIn!);
    _update();
    LoadingWidget.hide();
  }

  Future<void> initAppVersion() async {
    if (appVersion != null) {
      return;
    }
    try {
      appVersion = await packageInfo.absoluteAppVersion();
    } catch (_) {}
  }

  void _initItems(bool isLogged) {
    _items = [];
    if (isLogged) {
      _items.add(ProfileEnum.myCertificates);
      _items.add(ProfileEnum.rateThisApp);
    }
    _items.add(ProfileEnum.privacyPolicy);
    _items.add(ProfileEnum.userTerms);
    _items.add(ProfileEnum.helpCenter);
    if (isLogged) {
      _items.add(ProfileEnum.accountDeletion);
    }
  }

  @override
  bool? isUserLoggedIn() => userLoggedIn;

  @override
  ProfileEnum item(int index) => _items[index];

  @override
  void onItemPressed(int index) {
    switch (item(index)) {
      default:
        break;
    }
  }

  @override
  List<ProfileEnum> get items => _items;

  @override
  UserEntity? get user => _user;

  @override
  String get version => appVersion ?? '0.0.0';
  @override
  String? get userRating => _userRating;

  @override
  Future<void> addUserRating() async {
    LoadingWidget.show();

    try {
      LoadingWidget.show();
      final params = AddRatingParams(
        kind: 'content',
        reference: user?.id,
        score: 1,
        text: _userRating,
      );
      await addRating.add(params);
      LoadingWidget.hide();
      ToastWidget.show(
        icon: Icons.annotationCheck.iconCopyWith(color: Colors.neutral025),
        message: R.string.rateWasSent,
        toastType: ToastType.success,
      );
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }

    LoadingWidget.hide();
  }

  @override
  void setUserRating(String rating) {
    _userRating = rating;
    _update();
  }

  @override
  Future<bool> hasNetwork() async {
    try {
      LoadingWidget.show();
      bool connection = false;
      connection = await networkConnection.hasNetwork();
      if (connection == false) ToastWidget.showNoInternet();
      LoadingWidget.hide();
      return connection;
    } catch (_) {
      ToastWidget.showGenericError();
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    bool success = false;
    LoadingWidget.show();

    try {
      Marcopolo().emit(DoLogoutEvent());
      success = true;
      init();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }

    if (success) {
      await _disableIterablePush();
      await init();
    }

    LoadingWidget.hide();
    return success;
  }

  Future<void> _disableIterablePush() async {
    try {
      await iterable.disablePush();
    } catch (_) {}
  }

  @override
  Future<void> openUrl(String url) async {
    LoadingWidget.show();
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
  }
}
