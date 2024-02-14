class Endpoint {
  String path;
  dynamic data;
  String method;
  String? contentType;
  Map<String, dynamic>? queryParameters;
  String? baseUrl;

  Endpoint({
    required this.path,
    required this.method,
    this.data,
    this.contentType,
    this.queryParameters,
    this.baseUrl,
  });
}
