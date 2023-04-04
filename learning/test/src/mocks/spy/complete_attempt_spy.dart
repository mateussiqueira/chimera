import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

class CompleteAttemptSpy extends Mock implements CompleteAttempt {
  When mockCompleteCall() =>
      when(() => complete(attemptId: any(named: 'attemptId')));

  void mockComplete({required AssessmentAttemptEntity attempt}) =>
      mockCompleteCall().thenAnswer((_) async => attempt);

  void mockCompleteError(dynamic error) => mockCompleteCall().thenThrow(error);
}
