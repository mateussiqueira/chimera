import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/domain.dart';

class LoadAttemptSpy extends Mock implements LoadAttempt {
  When mockLoadCall() => when(() => load(id: any(named: 'id')));

  void mockLoad({required AssessmentAttemptEntity attempt}) =>
      mockLoadCall().thenAnswer((_) async => attempt);

  void mockLoadError(dynamic error) => mockLoadCall().thenThrow(error);
}
