import 'content_kind.dart';
import 'package:dependencies/dependencies.dart';

class ContentEntity extends Equatable {
  const ContentEntity({
    this.coreId,
    this.coreKind,
    this.id,
    this.name,
    this.url,
  });

  final String? coreId;
  final ContentKind? coreKind;
  final String? id;
  final String? name;
  final String? url;

  @override
  List get props => [
        coreId,
        coreKind,
        id,
        name,
        url,
      ];
}
