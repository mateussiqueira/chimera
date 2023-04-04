import 'package:flutter/material.dart';

import 'update_presenter.dart';

class NotifierUpdatePresenter with ChangeNotifier implements UpdatePresenter {
  @override
  void update() => notifyListeners();
}
