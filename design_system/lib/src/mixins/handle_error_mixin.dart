import 'dart:io';

import 'package:generic_exception/generic_exception.dart';

import '../../design_system.dart';

enum Errors { error, noInternet, generic, none }

mixin HandleErrorMixin {
  final ValueNotifier<Errors> _currentError = ValueNotifier(Errors.none);

  set currentError(Errors e) {
    _currentError.value = e;
  }

  Errors get currentError => _currentError.value;

  void handleError(Errors error, dynamic exception) {
    if (error == Errors.error) {
      currentError = error;

      if (!Platform.environment.containsKey('FLUTTER_TEST')) {
        exception as DomainError;
        ToastWidget.show(message: exception.message);
      }
    }
    if (error == Errors.noInternet) {
      currentError = error;
      if (!Platform.environment.containsKey('FLUTTER_TEST')) {
        ToastWidget.showNoInternet();
      }
    }
    if (error == Errors.generic) {
      currentError = error;
      if (!Platform.environment.containsKey('FLUTTER_TEST')) {
        ToastWidget.showGenericError();
      }
    }
  }
}
