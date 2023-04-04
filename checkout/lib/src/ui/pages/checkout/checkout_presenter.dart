import 'package:flutter/foundation.dart';

abstract class CheckoutPresenter implements Listenable {
  Future<void> configureUrl();
  Future<void> download(String url);

  String get url;
}
