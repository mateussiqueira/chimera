import 'package:discovery/src/data/params/params.dart';
import 'package:discovery/src/ui/pages/product_list/product_list_presenter.dart';

mixin RemotePaginationMixin implements ProductListPresenter {
  @override
  Future<void> nextPage() async {
    final pagination = this.pagination;
    final params = this.params;
    if (pagination != null) {
      final currentPage = params?.page ?? 0;
      final totalPages = pagination.totalPages ?? 0;
      if (currentPage < totalPages) {
        if (params is RemoteLoadProductsParams) {
          this.params = params.copyWith(page: currentPage + 1);
          await load();
        }
      }
    }
  }
}
