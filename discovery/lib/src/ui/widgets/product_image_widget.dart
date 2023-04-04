import 'package:design_system/design_system.dart';
import 'package:discovery/src/domain/domain.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    Key? key,
    this.product,
    this.height,
    this.width,
  }) : super(key: key);

  final ProductEntity? product;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    if (productImage != null) {
      return NetworkImageWidget(
        url: productImage,
        fit: BoxFit.cover,
        height: height,
        width: width,
      );
    }
    return SizedBox(
      child: ImageWidget(
        image: Images.videoPlaceholder,
        fit: BoxFit.cover,
        height: height,
        width: width,
      ),
    );
  }

  String? get productImage => product?.media?.cardImage;
}
