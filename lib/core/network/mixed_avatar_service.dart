import 'package:dio/dio.dart';
import 'package:spotify_app/core/network/backend_url.dart';

class MixedAvatarService {
  final Dio _dio = Dio();

  MixedAvatarService() {
    _dio.options.baseUrl = '${BackendUrl().backendUrl}api';
    _dio.options.headers = {'Accept': 'application/json'};
  }
  Future<Response> fetchMixedAvatar() async {
    try {
      final Response response = await _dio.get('/');
      return response;
    } catch (e) {
      throw Exception("❌ Error fetching mixed avatars: $e");
    }
  }
}
