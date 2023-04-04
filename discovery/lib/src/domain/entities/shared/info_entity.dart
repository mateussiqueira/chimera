import 'package:dependencies/dependencies.dart';

class InfoEntity extends Equatable {
  const InfoEntity({
    required this.courseCount,
    required this.enrollmentCount,
    required this.userCount,
  });

  final int? courseCount;
  final int? enrollmentCount;
  final int? userCount;

  @override
  List get props => [courseCount, enrollmentCount, userCount];
}
