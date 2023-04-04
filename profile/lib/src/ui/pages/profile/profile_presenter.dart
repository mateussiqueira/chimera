import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:profile/src/ui/pages/profile/profile_enum.dart';

abstract class ProfilePresenter implements Listenable {
  Future<void> init();
  Future<void> addUserRating();
  List<ProfileEnum> get items;
  void onItemPressed(int index);
  void setUserRating(String rating);
  ProfileEnum item(int index);
  String get version;
  String? get userRating;
  UserEntity? get user;
  Future<bool> hasNetwork();
  bool? isUserLoggedIn();
  Future<bool> logout();
  Future<void> openUrl(String url);
}
