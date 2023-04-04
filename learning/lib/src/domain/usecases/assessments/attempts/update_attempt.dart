import '../../../params/params.dart';

abstract class UpdateAttempt {
  Future<void> update({
    required List<UpdateAttemptParams> params,
    required String attemptId,
  });
}
