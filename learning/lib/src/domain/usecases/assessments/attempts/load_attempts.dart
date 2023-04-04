import 'package:courses/courses.dart';

abstract class LoadAttempts {
  Future<List<AssessmentAttemptEntity>?> load();
}
