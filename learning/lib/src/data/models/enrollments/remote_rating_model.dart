import 'package:learning/src/domain/domain.dart';

class RemoteRatingModel extends RatingEntity {
  const RemoteRatingModel({
    super.rateKind,
    super.reference,
    super.score,
  });

  factory RemoteRatingModel.fromJson(Map<String, dynamic> map) {
    return RemoteRatingModel(
      rateKind: RatingKingExtention.ratingKindFromApiText(map['kind']),
      reference: map['reference'],
      score: map['score'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kind': rateKind?.apiText,
      'reference': reference,
      'score': score,
    };
  }

  static List<RemoteRatingModel>? toEntityList(List<dynamic>? list) {
    final result = list?.map((obj) => RemoteRatingModel.fromJson(obj)).toList();
    return result;
  }
}
