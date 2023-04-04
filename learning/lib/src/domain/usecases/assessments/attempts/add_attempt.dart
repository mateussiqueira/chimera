import '../../../domain.dart';
import 'package:courses/courses.dart';

abstract class AddAttempt {
  Future<AssessmentAttemptEntity> add({required AddAttemptParams params});
}
