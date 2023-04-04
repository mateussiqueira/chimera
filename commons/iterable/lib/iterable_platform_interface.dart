import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'iterable_method_channel.dart';

abstract class IterablePlatform extends PlatformInterface {
  /// Constructs a IterablePlatform.
  IterablePlatform() : super(token: _token);

  static final Object _token = Object();

  static IterablePlatform _instance = MethodChannelIterable();

  /// The default instance of [IterablePlatform] to use.
  ///
  /// Defaults to [MethodChannelIterable].
  static IterablePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IterablePlatform] when
  /// they register themselves.
  static set instance(IterablePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initSecrets(String apiKey);

  Future<void> initialize();

  Future<void> configureIterable(String email);

  Future<void> disablePush();
}
