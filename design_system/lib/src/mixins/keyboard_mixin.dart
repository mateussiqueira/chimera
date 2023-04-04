import 'package:flutter/material.dart';

mixin KeyboardMixin {
  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void nextFocus() {
    FocusManager.instance.primaryFocus?.nextFocus();
  }
}
