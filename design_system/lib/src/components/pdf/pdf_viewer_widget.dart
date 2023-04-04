import 'package:design_system/design_system.dart' hide Colors;
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PdfViewerWidget extends StatefulWidget {
  const PdfViewerWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  final controller = PdfViewerController();
  TapDownDetails? doubleTapDetails;
  final double maxZoom = 3.375;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultCacheManager().getSingleFile(widget.url),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return GestureDetector(
            onDoubleTapDown: (details) => doubleTapDetails = details,
            onDoubleTap: () => _shouldZoomPdf(),
            child: PdfViewer.openFile(
              snapshot.data!.path,
              viewerController: controller,
              params: PdfViewerParams(
                maxScale: maxZoom,
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: Sizes.size04,
            color: tertiaryModuleStyle.textModulePrimaryColor(context),
          ),
        );
      },
    );
  }

  _shouldZoomPdf() {
    final ctrl = controller.ready;
    if (ctrl != null) {
      final currentZoom = ctrl.zoomRatio;
      if (currentZoom * 1.5 <= maxZoom) {
        ctrl.setZoomRatio(
          zoomRatio: controller.zoomRatio * 1.5,
          center: doubleTapDetails!.localPosition,
        );
      } else {
        ctrl.setZoomRatio(zoomRatio: 1);
      }
    }
  }
}
