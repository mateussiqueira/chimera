import 'package:dependencies/dependencies.dart';

class AssessmentEntity extends Equatable {
  const AssessmentEntity({
    this.id,
    this.maxAttempts,
    this.name,
    this.passingScore,
    this.timeInSeconds,
  });

  final String? id;
  final int? maxAttempts;
  final String? name;
  final int? passingScore;
  final int? timeInSeconds;

  @override
  List get props => [id, maxAttempts, name, passingScore, timeInSeconds];
}
