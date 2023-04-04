import 'package:dependencies/dependencies.dart';

import '../entities.dart';

class EnrollmentsEntity extends Equatable {
  const EnrollmentsEntity({
    required this.data,
    this.pagination,
  });

  final List<EnrollmentEntity> data;
  final PaginationEntity? pagination;

  @override
  List<Object?> get props => [
        data,
        pagination,
      ];
}
