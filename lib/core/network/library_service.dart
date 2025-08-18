import 'package:dio/dio.dart';
import 'package:spotify_app/core/network/backend_url.dart';

class LibraryService {
  final Dio _dio = Dio();

  LibraryService() {
    _dio.options.baseUrl = '${BackendUrl().backendUrl}api/library';
    _dio.options.headers = {'Accept': 'application/json'};
  }
  Future<Response> fetchLibraryDetails() async {
    try {
      final Response response = await _dio.get('/');
      return response;
    } catch (e) {
      throw Exception("❌ Error fetching library details: $e");
    }
  }
}
