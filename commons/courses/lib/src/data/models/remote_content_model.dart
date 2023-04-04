import '../../domain/entities/entities.dart';

class RemoteContentModel extends ContentEntity {
  const RemoteContentModel({
    super.coreId,
    super.coreKind,
    super.id,
    super.name,
    super.url,
    this.isCompleted = false,
  });

  final bool isCompleted;

  factory RemoteContentModel.fromJson(
    Map<String, dynamic> map,
    List<String> contentCompletedList,
  ) {
    return RemoteContentModel(
      id: map['id'],
      coreId: map['core_id'],
      coreKind: ContentKind.fromString(map['core_kind']),
      name: map['name'],
      url: map['url'],
      isCompleted: contentCompletedList.contains(map['id']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'core_id': coreId,
      'core_kind': coreKind,
      'name': name,
      'url': url,
    };
  }

  RemoteContentModel copyWith({
    String? coreId,
    ContentKind? coreKind,
    String? id,
    String? name,
    String? url,
    bool? isCompleted,
  }) {
    return RemoteContentModel(
      id: id ?? this.id,
      coreId: coreId ?? this.coreId,
      coreKind: coreKind ?? this.coreKind,
      name: name ?? this.name,
      url: url ?? this.url,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
