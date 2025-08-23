import 'package:dio/dio.dart';
import 'package:spotify_app/core/network/backend_url.dart';

class AlbumSongsService {
  final Dio _dio = Dio();

  AlbumSongsService() {
    _dio.options.baseUrl = '${BackendUrl().backendUrl}api/album-song/details';
    _dio.options.headers = {'Accept': 'application/json'};
  }
  Future<Response> fetchAlbumDetailsById(String albumId) async {
    try {
      final Response response = await _dio.get('/$albumId');
      return response;
    } catch (e) {
      throw Exception("Error fetching albums of albumId : $albumId");
    }
  }
}
