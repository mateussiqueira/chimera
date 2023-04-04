import 'package:dependencies/dependencies.dart';

class UpdateAttemptParams extends Equatable {
  const UpdateAttemptParams({
    required this.alternativeId,
    required this.questionId,
  });

  final String? alternativeId;
  final String? questionId;

  @override
  List get props => [alternativeId, questionId];
}
