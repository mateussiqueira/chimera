import 'package:dependencies/dependencies.dart';

class ScoreEntity extends Equatable {
  const ScoreEntity({
    this.current,
    this.required,
  });

  final int? current;
  final int? required;

  @override
  List get props => [current, required];
}
