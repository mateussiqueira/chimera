import 'package:dependencies/dependencies.dart';

import '../entities.dart';

class ProductsEntity extends Equatable {
  const ProductsEntity({
    required this.data,
    this.pagination,
  });

  final List<ProductEntity> data;
  final PaginationEntity? pagination;

  @override
  List<Object?> get props => [
        data,
        pagination,
      ];
}
