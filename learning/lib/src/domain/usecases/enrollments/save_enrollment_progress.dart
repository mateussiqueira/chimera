abstract class SaveEnrollmentProgress {
  Future<void> save({
    required String enrollmentId,
    required String contentId,
  });
}
