import 'package:dio/dio.dart';
import 'package:spotify_app/core/network/backend_url.dart';

class SongService {
  final Dio _dio = Dio();

  SongService() {
    _dio.options.baseUrl = '${BackendUrl().backendUrl}api/songs';
    _dio.options.headers = {'Accept': 'application/json'};
  }
  Future<Response> fetchSongsForPlaylist() async {
    try {
      final Response response = await _dio.get('/random');
      return response;
    } catch (e) {
      throw Exception("❌ Error fetching artist: $e");
    }
  }

  Future<Response> fetchSongforDefaults() async {
    try {
      final Response response = await _dio.get('/default');
      return response;
    } catch (e) {
      throw Exception("❌ Error fetching artist: $e");
    }
  }

  Future<Response> fetchSongById(String songId) async {
    try {
      final Response response = await _dio.get('/$songId');
      return response;
    } catch (e) {
      throw Exception("Error fetching albums of songId : $songId");
    }
  }
}
