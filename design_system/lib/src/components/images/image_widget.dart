import 'package:design_system/design_system.dart';
import 'package:flutter_svg/svg.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({
    super.key,
    required this.image,
    this.color,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  final Images image;
  final Color? color;
  final double? size;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    if (isSvg) {
      return SvgPicture.asset(
        imageInfo.filePath,
        color: widget.color,
        width: widget.size ?? widget.width,
        height: widget.size ?? widget.height,
        semanticsLabel: imageInfo.alt,
        package: imageInfo.package,
        fit: widget.fit,
        alignment: widget.alignment,
      );
    }
    return Image(
      image: AssetImage(
        imageInfo.filePath,
        package: imageInfo.package,
      ),
      color: widget.color,
      width: widget.size ?? widget.width,
      height: widget.size ?? widget.height,
      fit: widget.fit,
    );
  }

  bool get isSvg => imageInfo.fileExtension == "svg";

  ImageInfo get imageInfo {
    final resolvedStyle = context.resolveStyle<ImagesStyle>();
    return resolvedStyle?.imageFrom(widget.image) ?? widget.image.imageInfo;
  }
}
