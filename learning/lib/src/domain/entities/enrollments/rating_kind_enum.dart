enum RatingKindEnum {
  content('content'),
  course('course');

  final String apiText;

  const RatingKindEnum(this.apiText);
}

extension RatingKingExtention on RatingKindEnum {
  static RatingKindEnum? ratingKindFromApiText(String? apiText) {
    if (apiText != null) {
      for (var kind in RatingKindEnum.values) {
        if (kind.apiText == apiText) {
          return kind;
        }
      }
    }
    return null;
  }
}
