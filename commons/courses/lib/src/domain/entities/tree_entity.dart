import 'package:dependencies/dependencies.dart';

import 'content_entity.dart';
import 'node_entity.dart';

class TreeEntity extends Equatable {
  const TreeEntity({
    this.contents,
    this.nodes,
  });

  final List<ContentEntity>? contents;
  final List<NodeEntity>? nodes;

  @override
  List get props => [
        contents,
        nodes,
      ];
}
