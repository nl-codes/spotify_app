import 'package:dio/dio.dart';

class ArtistAvatarService {
  final Dio _dio = Dio();
  ArtistAvatarService() {
    _dio.options.baseUrl = 'http://192.168.18.3:5000/api/artists';
    _dio.options.headers = {'Accept': 'application/json'};
  }
  Future<Response> fetchArtistAvatar() async {
    try {
      final Response response = await _dio.get('/');
      return response;
    } catch (e) {
      throw Exception("❌ Error fetching artist avatar: $e");
    }
  }
}
