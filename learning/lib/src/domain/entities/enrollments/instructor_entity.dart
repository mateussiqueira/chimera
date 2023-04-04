import 'package:dependencies/dependencies.dart';

class InstructorEntity extends Equatable {
  const InstructorEntity({
    this.avatar,
    this.bio,
    this.headline,
    this.name,
  });

  final String? avatar;
  final String? bio;
  final String? headline;
  final String? name;

  @override
  List get props => [
        avatar,
        bio,
        headline,
        name,
      ];
}
