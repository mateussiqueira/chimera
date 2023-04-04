class HttpResponse {
  HttpResponse({
    required this.data,
    this.headers,
  });

  final dynamic data;
  final Map<String, dynamic>? headers;
}
