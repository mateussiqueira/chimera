import 'package:dependencies/dependencies.dart';

import 'content_entity.dart';

class NodeEntity extends Equatable {
  const NodeEntity({
    this.contents,
    this.id,
    this.name,
    this.nodes,
  });

  final List<ContentEntity>? contents;
  final String? id;
  final String? name;
  final List<NodeEntity>? nodes;

  @override
  List get props => [
        contents,
        id,
        name,
        nodes,
      ];
}
