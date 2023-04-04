import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';

class NetworkImageProvider extends CachedNetworkImageProvider {
  NetworkImageProvider(super.url) : super(imageStreamListener: imageListener);

  static final ImageStreamListener imageListener = ImageStreamListener(
    (image, synchronousCall) {},
    onError: (exception, stackTrace) {},
  );
}
