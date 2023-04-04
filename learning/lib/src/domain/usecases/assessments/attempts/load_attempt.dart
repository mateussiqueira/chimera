import 'package:courses/courses.dart';

abstract class LoadAttempt {
  Future<AssessmentAttemptEntity> load({required String id});
}
