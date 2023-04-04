import 'package:learning/src/data/models/certificates/remote_score_model.dart';

import '../../../domain/domain.dart';

class RemoteCertificateGoalModel {
  final Map<String, dynamic>? json;

  RemoteCertificateGoalModel({required this.json});

  factory RemoteCertificateGoalModel.fromJson(Map<String, dynamic> json) =>
      RemoteCertificateGoalModel(json: json);

  CertificateGoalEntity toEntity() => CertificateGoalEntity(
        completedContents:
            RemoteScoreModel(json: json?['completed_contents']).toEntity(),
        minAssessmentsScore:
            RemoteScoreModel(json: json?['min_assessments_score']).toEntity(),
        passedAssessments:
            RemoteScoreModel(json: json?['passed_assessments']).toEntity(),
      );
}
