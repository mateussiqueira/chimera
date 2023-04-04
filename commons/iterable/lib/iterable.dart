import 'iterable_platform_interface.dart';

class IterableOPX {
  Future<void> initSecrets(String apiKey) {
    return IterablePlatform.instance.initSecrets(apiKey);
  }

  Future<void> initialize() async {
    return IterablePlatform.instance.initialize();
  }

  Future<void> configureIterable(String email) async {
    return IterablePlatform.instance.configureIterable(email);
  }

  Future<void> disablePush() async {
    return IterablePlatform.instance.disablePush();
  }
}
