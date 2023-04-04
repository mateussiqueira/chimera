import '../../domain/entities/entities.dart';
import 'models.dart';

class RemoteNodeModel extends NodeEntity {
  const RemoteNodeModel({
    super.contents,
    super.id,
    super.name,
    super.nodes,
  });

  factory RemoteNodeModel.fromJson(
    Map<String, dynamic> json,
    List<String> contentCompletedList,
  ) {
    return RemoteNodeModel(
      id: json['id'],
      name: json['name'],
      contents: List<RemoteContentModel>.from(
        json['contents'].map(
          (content) =>
              RemoteContentModel.fromJson(content, contentCompletedList),
        ),
      ),
      nodes: List<RemoteNodeModel>.from(
        json['nodes'].map(
          (node) => RemoteNodeModel.fromJson(node, contentCompletedList),
        ),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'contents':
          contents?.map((e) => (e as RemoteContentModel).toMap()).toList(),
      'nodes': nodes?.map((e) => (e as RemoteNodeModel).toMap()).toList(),
    };
  }
}
