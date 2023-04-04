enum AssessmentAnswerStatus {
  blank('blank'),
  correct('correct'),
  pending('pending'),
  wrong('wrong');

  const AssessmentAnswerStatus(this.name);

  final String name;
}

extension AssessmentAnswerStatusExtension on AssessmentAnswerStatus {
  static AssessmentAnswerStatus? assessmentAnswerStatusByApiText(
      String? apiText) {
    if (apiText != null) {
      for (var status in AssessmentAnswerStatus.values) {
        if (status.name == apiText) {
          return status;
        }
      }
    }
    return null;
  }
}
