import 'package:flutter/services.dart';
import 'package:generic_exception/generic_exception.dart';
import 'iterable_platform_interface.dart';

class MethodChannelIterable extends IterablePlatform {
  static const _channelName = 'grupoq.io/iterable';
  static const _methodNameInitSecrets = 'initSecrets';
  static const _methodNameInitialize = 'initialize';
  static const _methodNameConfigure = 'configure';
  static const _methodNameDisable = 'disable';
  static const _paramNameApiKey = 'apiKey';
  static const _paramNameEmail = 'email';

  final _methodChannel = const MethodChannel(_channelName);

  @override
  Future<void> initSecrets(String apiKey) async {
    try {
      final parameters = {
        _paramNameApiKey: apiKey,
      };

      await _methodChannel.invokeMethod(
        _methodNameInitSecrets,
        parameters,
      );
    } on PlatformException catch (_) {
      throw UnexpectedError();
    }
  }

  @override
  Future<void> initialize() async {
    try {
      await _methodChannel.invokeMethod(
        _methodNameInitialize,
      );
    } on PlatformException catch (_) {
      throw UnexpectedError();
    }
  }

  @override
  Future<void> configureIterable(String email) async {
    try {
      final parameters = {
        _paramNameEmail: email,
      };

      await _methodChannel.invokeMethod(
        _methodNameConfigure,
        parameters,
      );
    } on PlatformException catch (_) {
      throw UnexpectedError();
    }
  }

  @override
  Future<void> disablePush() async {
    try {
      await _methodChannel.invokeMethod(
        _methodNameDisable,
      );
    } catch (_) {}
  }
}
