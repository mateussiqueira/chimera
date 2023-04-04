import '../../domain/entities/entities.dart';
import 'models.dart';

class RemoteTreeModel extends TreeEntity {
  const RemoteTreeModel({
    super.contents,
    super.nodes,
  });

  factory RemoteTreeModel.fromJson(
    Map<String, dynamic> json,
    List<String> contentCompletedList,
  ) {
    return RemoteTreeModel(
      contents: List<RemoteContentModel>.from(
        json['contents'].map(
          (content) => RemoteContentModel.fromJson(
            content,
            contentCompletedList,
          ),
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
      'contents':
          contents?.map((e) => (e as RemoteContentModel).toMap()).toList(),
      'nodes': nodes?.map((e) => (e as RemoteNodeModel).toMap()).toList(),
    };
  }

  void contentsSerialized(
      List<NodeEntity> nodeList, List<ContentEntity> contentsSerializedFinal) {
    if (nodeList.isNotEmpty == true) {
      for (NodeEntity node in nodeList) {
        if (node.contents?.isNotEmpty == true) {
          contentsSerializedFinal += node.contents!;
        }
        if (node.nodes?.isNotEmpty == true) {
          contentsSerialized(node.nodes!, contentsSerializedFinal);
        }
      }
    }
  }
}
