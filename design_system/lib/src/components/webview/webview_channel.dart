class WebViewChannel {
  WebViewChannel({
    required this.name,
    required this.onMessageReceived,
  });

  final String name;
  final Function(String message) onMessageReceived;
}
