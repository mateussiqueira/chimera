import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

class AddAttemptSpy extends Mock implements AddAttempt {
  When mockAddCall() => when(() => add(params: any(named: 'params')));

  void mockAdd({required AssessmentAttemptEntity attempt}) =>
      mockAddCall().thenAnswer((_) async => attempt);

  void mockAddError(dynamic error) => mockAddCall().thenThrow(error);
}
