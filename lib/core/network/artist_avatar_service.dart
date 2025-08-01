import 'package:dio/dio.dart';
import 'package:spotify_app/core/network/backend_url.dart';

class ArtistAvatarService {
  final Dio _dio = Dio();

  ArtistAvatarService() {
    _dio.options.baseUrl = '${BackendUrl().backendUrl}api/artists';
    _dio.options.headers = {'Accept': 'application/json'};
  }
  Future<Response> fetchArtistAvatar() async {
    try {
      final Response response = await _dio.get('/');
      return response;
    } catch (e) {
      throw Exception("❌ Error fetching artist: $e");
    }
  }
}
