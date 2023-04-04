import 'package:iterable/iterable_method_channel.dart';
import '../../domain/domain.dart';

class RemoteInitUser implements InitUser {
  RemoteInitUser({
    required this.iterableChannel,
    required this.remoteLoadUser,
    required this.localSaveAccount,
    required this.localSaveUser,
  });

  final MethodChannelIterable iterableChannel;
  final LoadUser remoteLoadUser;
  final SaveAccount localSaveAccount;
  final SaveUser localSaveUser;

  @override
  Future<void> initUser({required AccountEntity account}) async {
    try {
      await localSaveAccount.save(account: account);
    } catch (_) {
      rethrow;
    }
    try {
      final user = await remoteLoadUser.load();
      if (user != null) {
        await localSaveUser.save(user: user);
        await iterableChannel.configureIterable(user.email);
      }
    } catch (_) {}
  }
}
