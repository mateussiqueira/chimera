import 'package:learning/src/domain/params/enrollments/remove_progress_params.dart';

class RemoteRemoveProgressParams extends RemoveProgressParams {
  const RemoteRemoveProgressParams({required super.id});

  Map<String, dynamic> get toBodyJson {
    return <String, dynamic>{
      'content': <String, dynamic>{
        'id': id,
      },
    };
  }
}
