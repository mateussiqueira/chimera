import 'package:dependencies/dependencies.dart';

class AnswerEntity extends Equatable {
  const AnswerEntity({
    required this.alternativeId,
    required this.questionId,
  });

  final String? alternativeId;
  final String? questionId;

  @override
  List get props => [
        alternativeId,
        questionId,
      ];
}
