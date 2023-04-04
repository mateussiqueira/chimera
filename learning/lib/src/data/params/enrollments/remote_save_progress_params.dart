import 'package:learning/src/domain/params/enrollments/update_progress_params.dart';

class RemoteSaveProgressParams extends UpdateProgressParams {
  const RemoteSaveProgressParams({required super.id});

  Map<String, dynamic> get toBodyJson {
    return <String, dynamic>{
      'content': <String, dynamic>{
        'id': id,
      },
    };
  }
}
