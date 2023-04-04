import '../../../domain/domain.dart';

class RemoteAddRatingParams {
  RemoteAddRatingParams({
    required this.params,
  });

  final AddRatingParams params;

  Map<String, dynamic> toParams() => {
        "kind": params.kind,
        "reference": params.reference,
        "score": params.score,
        "text": params.text,
      };
}
