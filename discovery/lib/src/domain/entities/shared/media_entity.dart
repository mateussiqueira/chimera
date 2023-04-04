import 'package:dependencies/dependencies.dart';

class MediaEntity extends Equatable {
  const MediaEntity({
    required this.cardImage,
  });

  final String? cardImage;

  @override
  List get props => [cardImage];
}
