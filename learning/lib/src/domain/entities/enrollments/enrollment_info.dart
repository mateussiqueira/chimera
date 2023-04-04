import 'package:dependencies/dependencies.dart';

class EnrollmentInfo extends Equatable {
  const EnrollmentInfo({this.goals});

  final List<String>? goals;

  @override
  List<Object?> get props => [
        goals,
      ];
}
