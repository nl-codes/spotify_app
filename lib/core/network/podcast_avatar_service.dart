import 'package:dio/dio.dart';
import 'package:spotify_app/core/network/backend_url.dart';

class PodcastAvatarService {
  final Dio _dio = Dio();

  PodcastAvatarService() {
    _dio.options.baseUrl = '${BackendUrl().backendUrl}api/podcasts';
    _dio.options.headers = {'Accept': 'application/json'};
  }
  Future<Response> fetchPodcastAvatar() async {
    try {
      final Response response = await _dio.get('/');
      return response;
    } catch (e) {
      throw Exception("❌ Error fetching podcasts: $e");
    }
  }
}
