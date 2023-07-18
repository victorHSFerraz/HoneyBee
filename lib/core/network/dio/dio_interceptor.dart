import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  const DioInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }
}
