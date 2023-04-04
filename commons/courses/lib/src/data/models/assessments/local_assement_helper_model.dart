import 'package:dependencies/dependencies.dart';
import '../../../domain/entities/entities.dart';

class LocalAssessmentHelperModel {
  LocalAssessmentHelperModel({
    this.durationInMinutes,
    this.minScore,
    this.name,
    this.number,
    this.remaining,
    this.score,
  });
  final int? durationInMinutes;
  final int? minScore;
  final String? name;
  final int? number;
  final int? remaining;
  final int? score;

  static LocalAssessmentHelperModel fromAssessmentProgresses(
      List<AssessmentProgressEntity>? progresses, ContentEntity? content) {
    AssessmentEntity? assessment = getAssessment(progresses, content);
    int durationInMinutes = timeInMinutes(progresses, content);
    int? minScore = assessment?.passingScore;
    String? name = assessment?.name;

    List<AssessmentAttemptEntity>? attempts =
        getAttemptsList(progresses, content);
    int? maxAttempts = assessment?.maxAttempts;
    int? number = attempts?.length;
    int? remaining = (maxAttempts ?? 0) - (attempts?.length ?? 0);
    int? score = attempts?.getOrNull((number ?? 0) - 1)?.score;

    return LocalAssessmentHelperModel(
      durationInMinutes: durationInMinutes,
      minScore: minScore,
      name: name,
      number: number,
      remaining: remaining,
      score: score,
    );
  }

  static AssessmentProgressEntity? getAssessmentProgress(
      List<AssessmentProgressEntity>? progresses, ContentEntity? content) {
    return progresses
        ?.firstWhereOrNull((e) => e.assessment?.id == content?.coreId);
  }

  static AssessmentEntity? getAssessment(
          List<AssessmentProgressEntity>? progresses, ContentEntity? content) =>
      getAssessmentProgress(
        progresses,
        content,
      )?.assessment;

  static List<AssessmentAttemptEntity>? getAttemptsList(
          List<AssessmentProgressEntity>? progresses, ContentEntity? content) =>
      getAssessmentProgress(progresses, content)?.attempts;

  static int? timeInSeconds(
          List<AssessmentProgressEntity>? progresses, ContentEntity? content) =>
      getAssessment(progresses, content)?.timeInSeconds;

  static int timeInMinutes(
          List<AssessmentProgressEntity>? progresses, ContentEntity? content) =>
      (timeInSeconds(progresses, content) ?? 0) ~/ 60;
}
