abstract class IHttpClient {
  Future<HttpResponse> get(HttpParams params);
  Future<HttpResponse> post(HttpParams params);
  Future<HttpResponse> delete(HttpParams params);
  Future<HttpResponse> update(HttpParams params);
  Future<HttpResponse> put(HttpParams params);
}

// Response

class HttpResponse {
  final int statusCode;
  final Map<String, dynamic> body;

  HttpResponse({required this.statusCode, required this.body});
}

// Params

class HttpParams {
  final String url;
  final Map<String, String> headers;
  final Map<String, dynamic> body;
  final Map<String, String> queryParameters;

  HttpParams({
    required this.url,
    this.headers = const {},
    this.body = const {},
    this.queryParameters = const {},
  });
}
