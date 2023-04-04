import 'package:design_system/design_system.dart';

class ImagesStyle extends ThemeExtension<ImagesStyle> {
  ImagesStyle({
    required this.imagesMap,
  });

  final Map<Images, ImageInfo>? imagesMap;

  static ImagesStyle light = ImagesStyle(
    imagesMap: {
      for (final image in Images.values) image: image.imageInfo,
    },
  );

  @override
  ThemeExtension<ImagesStyle> copyWith({Map<Images, ImageInfo>? imagesMap}) {
    final newImagesMap = {...?this.imagesMap};
    if (imagesMap != null) {
      for (final image in imagesMap.entries) {
        newImagesMap[image.key] = image.value;
      }
    }

    return ImagesStyle(imagesMap: newImagesMap);
  }

  ImageInfo imageFrom(Images image) {
    return imagesMap?[image] ?? image.imageInfo;
  }

  @override
  ThemeExtension<ImagesStyle> lerp(
          ThemeExtension<ImagesStyle>? other, double t) =>
      this;
}
