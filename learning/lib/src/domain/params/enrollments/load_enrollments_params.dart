import 'package:dependencies/dependencies.dart';

abstract class LoadEnrollmentsParams extends Equatable {
  const LoadEnrollmentsParams({
    this.page = 1,
    this.items = 10,
  });

  final int page;
  final int items;

  @override
  List<Object?> get props => [page, items];
}
