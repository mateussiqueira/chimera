import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

enum ProfileEnum {
  accountDeletion,
  helpCenter,
  myCertificates,
  notifications,
  privacyPolicy,
  rateThisApp,
  userTerms,
}

extension ProfileEnumExtension on ProfileEnum {
  String get name {
    switch (this) {
      case ProfileEnum.accountDeletion:
        return R.string.accountDeletion;
      case ProfileEnum.helpCenter:
        return R.string.helpCenter;
      case ProfileEnum.myCertificates:
        return R.string.myCertificates;
      case ProfileEnum.notifications:
        return R.string.notifications;
      case ProfileEnum.privacyPolicy:
        return R.string.privacyPolicy;
      case ProfileEnum.rateThisApp:
        return R.string.rateThisApp;
      case ProfileEnum.userTerms:
        return R.string.userTerms;
    }
  }

  Icons get icon {
    switch (this) {
      case ProfileEnum.accountDeletion:
        return Icons.trash04;
      case ProfileEnum.helpCenter:
        return Icons.helpCircle;
      case ProfileEnum.myCertificates:
        return Icons.certificate01;
      case ProfileEnum.notifications:
        return Icons.bell02;
      case ProfileEnum.privacyPolicy:
        return Icons.lock01;
      case ProfileEnum.rateThisApp:
        return Icons.star01;
      case ProfileEnum.userTerms:
        return Icons.file06;
    }
  }
}
