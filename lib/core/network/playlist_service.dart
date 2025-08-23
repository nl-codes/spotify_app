import 'package:dio/dio.dart';
import 'package:spotify_app/core/network/backend_url.dart';

class PlaylistService {
  final Dio _dio = Dio();

  PlaylistService() {
    _dio.options.baseUrl = '${BackendUrl().backendUrl}api/playlists';
    _dio.options.headers = {'Accept': 'application/json'};
  }
  Future<Response> fetchPlaylists() async {
    try {
      final Response response = await _dio.get('/');
      return response;
    } catch (e) {
      throw Exception("❌ Error fetching artist: $e");
    }
  }
}
