import '../../../data/models/enrollments/enrollments.dart';

abstract class LoadEnrollmentRatings {
  Future<List<RemoteRatingModel>?> load({required RemoteRatingModel params});
}
