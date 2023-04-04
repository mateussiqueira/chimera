import 'package:dependencies/dependencies.dart';

class AlternativeEntity extends Equatable {
  const AlternativeEntity({
    required this.id,
    required this.statement,
  });

  final String? id;
  final String? statement;

  @override
  List get props => [id, statement];
}
