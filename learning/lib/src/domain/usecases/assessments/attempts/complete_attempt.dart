import 'package:courses/courses.dart';

abstract class CompleteAttempt {
  Future<AssessmentAttemptEntity> complete({required String attemptId});
}
