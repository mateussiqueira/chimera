import 'package:learning/src/domain/domain.dart';
import 'package:courses/courses.dart';

class RemoteUpdateAttemptParams {
  RemoteUpdateAttemptParams(this.params);
  final List<UpdateAttemptParams> params;

  Map<String, dynamic> toParams() => {
        "answers": params
            .map((e) => {
                  "question_id": e.questionId,
                  "alternative_id": e.alternativeId
                })
            .toList()
      };

  static List<UpdateAttemptParams> fromAnswers(List<AnswerEntity>? answers) {
    return answers
            ?.map((e) => UpdateAttemptParams(
                  alternativeId: e.alternativeId,
                  questionId: e.questionId,
                ))
            .toList() ??
        [];
  }
}
