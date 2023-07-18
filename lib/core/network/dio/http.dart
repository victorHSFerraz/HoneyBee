import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:honey_bee/core/network/dio/dio_interceptor.dart';

class Http extends DioForNative {
  Http(BaseOptions options) : super(options) {
    (httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final HttpClient client = HttpClient();
      client.badCertificateCallback = (_, __, ___) => true;

      return client;
    };
    options.baseUrl = "https://api.github.com/";
    options.connectTimeout = const Duration(seconds: 30000);
    options.receiveTimeout = const Duration(seconds: 30000);
    options.responseType = ResponseType.json;
    options.validateStatus = (status) {
      return status! <= 500;
    };
    options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    interceptors.add(DioInterceptor());
  }
}
