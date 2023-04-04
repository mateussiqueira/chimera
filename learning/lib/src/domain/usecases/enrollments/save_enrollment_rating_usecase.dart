import '../../../data/models/enrollments/enrollments.dart';

abstract class SaveEnrollmentRating {
  Future<void> save({required RemoteRatingModel rating});
}
