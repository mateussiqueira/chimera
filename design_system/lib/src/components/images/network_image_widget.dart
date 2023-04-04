import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';

class NetworkImageWidget extends StatefulWidget {
  const NetworkImageWidget({
    Key? key,
    required this.url,
    this.fit,
    this.height,
    this.width,
  }) : super(key: key);

  final String? url;
  final BoxFit? fit;
  final double? height;
  final double? width;

  @override
  State<NetworkImageWidget> createState() => _NetworkImageWidgetState();
}

class _NetworkImageWidgetState extends State<NetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: UniqueKey(),
      imageUrl: widget.url ?? '',
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      errorWidget: (context, url, error) => _refreshButton,
      progressIndicatorBuilder: _progressIndicatorBuilder,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      imageStreamListener: NetworkImageProvider.imageListener,
    );
  }

  Widget _progressIndicatorBuilder(
    BuildContext context,
    String url,
    DownloadProgress progress,
  ) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: Sizes.size04,
        color: tertiaryModuleStyle.textModulePrimaryColor(context),
      ),
    );
  }

  Widget get _refreshButton {
    return MaterialButton(
      minWidth: 0,
      child: Icons.refreshCw01.icon,
      onPressed: () {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }
}
