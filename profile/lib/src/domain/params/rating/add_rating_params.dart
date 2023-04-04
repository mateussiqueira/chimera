class AddRatingParams {
  AddRatingParams({
    this.kind,
    this.reference,
    this.score,
    this.text,
  });

  final String? kind;
  final String? reference;
  final int? score;
  final String? text;
}
