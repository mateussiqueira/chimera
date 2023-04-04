import 'package:dependencies/dependencies.dart';

class PaginationEntity extends Equatable {
  const PaginationEntity({
    required this.page,
    required this.perPage,
    this.totalPages,
    this.totalItems,
  });

  final int page;
  final int perPage;
  final int? totalPages;
  final int? totalItems;

  @override
  List<Object?> get props => [
        page,
        perPage,
        totalPages,
        totalItems,
      ];
}
