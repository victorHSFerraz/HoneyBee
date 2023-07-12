import 'package:dio/dio.dart';
import 'package:honey_bee/core/network/dio/http.dart';
import 'package:honey_bee/core/network/http_client/http_client.dart';

class HttpClientDio implements IHttpClient {
  late Http _http;

  HttpClientDio() {
    _http = Http(BaseOptions());
  }

  @override
  Future<HttpResponse> get(String url) async {
    final response = await _http.get(url);
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body}) async {
    final response = await _http.post(url, data: body);
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> put(String url, {required Map<String, dynamic> body}) async {
    final response = await _http.put(url, data: body);
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> delete(String url) async {
    final response = await _http.delete(url);
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }
}
