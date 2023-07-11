abstract class IHttpClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body});
  Future<HttpResponse> put(String url, {required Map<String, dynamic> body});
  Future<HttpResponse> delete(String url);
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({required this.data, required this.statusCode});
}
