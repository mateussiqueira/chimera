import '../../domain/entities/certificate_entity.dart';

class RemoteCertificateModel {
  final Map<String, dynamic>? json;

  RemoteCertificateModel({required this.json});

  factory RemoteCertificateModel.fromJson(Map<String, dynamic> json) =>
      RemoteCertificateModel(json: json);

  CertificateEntity toEntity() => CertificateEntity(
        completedAt: json?['completed_at'] != null
            ? DateTime.parse(json?["completed_at"])
            : null,
        courseName: json?['course_name'],
        durationInHours: json?['duration_in_hours'],
        id: json?['id'],
        recipientName: json?['recipient_name'],
      );
}
