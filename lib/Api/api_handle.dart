import 'package:dio/dio.dart';

class HttpService {
  static final HttpService instance = HttpService._internal();
  late final Dio _dio;

  factory HttpService() {
    return instance;
  }

  HttpService._internal() {
    _dio = Dio();
  }

  Future<Response> getRequest(String url) async {
    try {
      return await _dio.get(url);
    } on DioException catch (e) {
      throw Exception('Failed to get data: ${e.response?.statusCode}');
    }
  }

  Future<Response> postRequest(String url, dynamic data) async {
    try {
      return await _dio.post(url, data: data);
    } on DioException catch (e) {
      throw Exception('Failed to post data: ${e.response?.statusCode}');
    }
  }

  void dispose() {
    // Cleanup code here
  }
}
