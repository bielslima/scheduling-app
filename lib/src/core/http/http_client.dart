import 'package:dio/dio.dart';

class HttpClient {
  late final Dio _dioInstance;

  HttpClient() {
    _dioInstance = Dio();
  }

  Future<Response> get(String url) async {
    final headers = await _buildHeaders();

    return _dioInstance.get(
      url,
      options: Options(
        headers: headers,
      ),
    );
  }

  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    final headers = await _buildHeaders();

    return _dioInstance.post(
      url,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
  }

  Future<Map<String, dynamic>> _buildHeaders() async {
    return {};
  }
}
