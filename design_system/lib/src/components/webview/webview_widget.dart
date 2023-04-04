import 'package:design_system/design_system.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({
    Key? key,
    required this.url,
    this.userAgent = 'Chimera-Webview/1.0',
    this.channels,
    this.clearCache = false,
  }) : super(key: key);

  final String url;
  final String? userAgent;
  final List<WebViewChannel>? channels;
  final bool clearCache;

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  InAppWebViewController? controller;
  bool isLoading = true;

  @override
  void didUpdateWidget(covariant WebViewWidget oldWidget) {
    if (oldWidget.url != widget.url && widget.url.isNotEmpty) {
      controller?.loadUrl(urlRequest: URLRequest(url: WebUri(widget.url)));
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: !isLoading ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
            widget.url,
          ),
        ),
        onWebViewCreated: (controller) {
          this.controller = controller;
          _setupChannels();
        },
        onLoadStart: (InAppWebViewController controller, WebUri? url) {
          loading = true;
        },
        onLoadStop: (InAppWebViewController controller, WebUri? url) {
          loading = false;
        },
        initialSettings: InAppWebViewSettings(
          mediaPlaybackRequiresUserGesture: false,
          useHybridComposition: true,
          allowsInlineMediaPlayback: true,
          clearCache: widget.clearCache,
          clearSessionCache: true,
          userAgent: widget.userAgent,
          cacheMode: CacheMode.LOAD_CACHE_ELSE_NETWORK,
          allowFileAccessFromFileURLs: true,
          allowUniversalAccessFromFileURLs: true,
          loadWithOverviewMode: false,
        ),
      ),
    );
  }

  set loading(bool value) {
    if (mounted) {
      setState(() => isLoading = value);
    }
  }

  Future<void> _setupChannels() async {
    final controller = this.controller;
    final channels = widget.channels;
    if (channels != null && controller != null) {
      for (final channel in channels) {
        await controller.addWebMessageListener(
          WebMessageListener(
            jsObjectName: channel.name,
            onPostMessage: (message, sourceOrigin, isMainFrame, replyProxy) {
              channel.onMessageReceived(message ?? '');
            },
          ),
        );
      }
    }
  }
}
