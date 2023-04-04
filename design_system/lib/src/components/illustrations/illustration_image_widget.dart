import 'package:design_system/design_system.dart';

import 'illustration_widget.dart';

class IllustrationImageWidget extends IllustrationWidget {
  IllustrationImageWidget({
    super.key,
    required this.image,
    required super.title,
    super.subTitle,
  }) : super(
          illustration: ImageWidget(image: image),
        );

  final Images image;
}
