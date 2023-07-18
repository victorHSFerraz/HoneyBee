import 'http_response.dart';

abstract class IHttpClient {
  const IHttpClient();

  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body});
  Future<HttpResponse> put(String url, {required Map<String, dynamic> body});
  Future<HttpResponse> delete(String url);
}
