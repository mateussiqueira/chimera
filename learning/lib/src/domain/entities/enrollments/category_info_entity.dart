import 'package:dependencies/dependencies.dart';

class CategoryInfoEntity extends Equatable {
  const CategoryInfoEntity({
    this.courseCount,
    this.enrollmentCount,
    this.userCount,
  });

  final int? courseCount;
  final int? enrollmentCount;
  final int? userCount;

  @override
  List get props => [
        courseCount,
        enrollmentCount,
        userCount,
      ];
}
