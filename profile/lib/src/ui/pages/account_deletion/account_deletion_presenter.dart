import 'package:design_system/design_system.dart';

abstract class AccountDeletionPresenter extends UpdatePresenter
    implements Listenable {
  set text(String text);
  Future<bool> delete();
}
