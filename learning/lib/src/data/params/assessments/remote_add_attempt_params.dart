import '../../../domain/domain.dart';

class RemoteAttemptParams extends AddAttemptParams {
  const RemoteAttemptParams({required super.id});

  Map<String, dynamic> toMap() => {
        "assessment": {
          "id": id,
        }
      };
}
