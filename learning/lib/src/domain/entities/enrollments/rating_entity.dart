import 'package:dependencies/dependencies.dart';
import 'package:learning/src/domain/entities/enrollments/rating_kind_enum.dart';

class RatingEntity extends Equatable {
  const RatingEntity({
    this.rateKind,
    this.reference,
    this.score,
  });

  final RatingKindEnum? rateKind;
  final String? reference;
  final int? score;

  @override
  List get props => [
        rateKind,
        reference,
        score,
      ];
}
