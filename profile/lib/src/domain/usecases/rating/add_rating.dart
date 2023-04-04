import '../../domain.dart';

abstract class AddRating {
  Future<void> add(AddRatingParams params);
}
