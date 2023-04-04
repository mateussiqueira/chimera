import 'package:connection/connection.dart';

class AtlasPaginationModel extends PaginationEntity {
  const AtlasPaginationModel({
    required super.page,
    required super.perPage,
    super.totalPages,
    super.totalItems,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'items': perPage,
    };
  }

  static AtlasPaginationModel? fromMap(Map<String, dynamic>? map) {
    if (map != null) {
      return AtlasPaginationModel(
        page: int.parse(map['x-page']),
        perPage: int.parse(map['x-count']),
        totalPages: int.parse(map['x-total-pages']),
        totalItems: int.parse(map['x-total-count']),
      );
    }
    return null;
  }
}
