import 'package:learning/src/domain/domain.dart';

class RemoteLoadEnrollmentsParams extends LoadEnrollmentsParams {
  const RemoteLoadEnrollmentsParams({
    super.items,
    super.page,
  });

  Map<String, dynamic> get toQueryParameters {
    return <String, dynamic>{
      'items': items,
      'page': page,
    };
  }

  RemoteLoadEnrollmentsParams copyWith({
    int? page,
    int? items,
  }) {
    return RemoteLoadEnrollmentsParams(
      page: page ?? this.page,
      items: items ?? this.items,
    );
  }
}
