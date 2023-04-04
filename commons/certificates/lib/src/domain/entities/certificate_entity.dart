import 'package:dependencies/dependencies.dart';

class CertificateEntity extends Equatable {
  const CertificateEntity({
    required this.completedAt,
    required this.courseName,
    required this.durationInHours,
    required this.id,
    required this.recipientName,
  });

  final DateTime? completedAt;
  final String? courseName;
  final int? durationInHours;
  final String? id;
  final String? recipientName;

  @override
  List get props => [
        completedAt,
        courseName,
        durationInHours,
        id,
        recipientName,
      ];
}
