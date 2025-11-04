import 'package:dio/dio.dart';

class Api {
  final Dio _dio;

  Api({required String baseUrl})
      : _dio = Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: const Duration(seconds: 5)));

  Future<Map<String, dynamic>> post(String path, {Map<String, dynamic>? data}) async {
    final res = await _dio.post(path, data: data);
    return res.data as Map<String, dynamic>;
  }
}
