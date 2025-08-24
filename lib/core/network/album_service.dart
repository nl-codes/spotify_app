import 'package:dio/dio.dart';
import 'package:spotify_app/core/network/backend_url.dart';

class AlbumService {
  final Dio _dio = Dio();

  AlbumService() {
    _dio.options.baseUrl = '${BackendUrl().backendUrl}api/albums';
    _dio.options.headers = {'Accept': 'application/json'};
  }
  Future<Response> fetchAlbums() async {
    try {
      final Response response = await _dio.get('/');
      return response;
    } catch (e) {
      throw Exception("❌ Error fetching albums: $e");
    }
  }
}
