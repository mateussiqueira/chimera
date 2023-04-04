import 'package:dependencies/dependencies.dart';

class MediaEntity extends Equatable {
  const MediaEntity({
    this.cardImage,
    this.headerImage,
  });

  final String? cardImage;
  final String? headerImage;

  @override
  List get props => [cardImage, headerImage];
}
