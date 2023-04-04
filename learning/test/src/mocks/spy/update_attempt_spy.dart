import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

class UpdateAttemptSpy extends Mock implements UpdateAttempt {
  When mockUpdateCall() => when(() =>
      update(attemptId: any(named: 'attemptId'), params: any(named: 'params')));

  void mockUpdate() => mockUpdateCall().thenAnswer((_) async => _);

  void mockUpdateError(dynamic error) => mockUpdateCall().thenThrow(error);
}
