import '../../../domain/entities/assessments/assessments.dart';

class AttemptsStatusHelpers {
  static fromString(String status) {
    switch (status) {
      case "pending":
        return AttemptsStatus.pending;
      case "completed":
        return AttemptsStatus.completed;
      case "corrected":
        return AttemptsStatus.corrected;
      case "scored":
        return AttemptsStatus.scored;
      case "passed":
        return AttemptsStatus.passed;
      case "failed":
        return AttemptsStatus.failed;
    }
  }
}
