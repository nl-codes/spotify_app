import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/playlist_api_model.dart';
import 'package:spotify_app/core/network/playlist_service.dart';
import 'package:spotify_app/screens/playlist/page/playlist_detail_screen.dart';
import 'package:spotify_app/widgets/failed_to_load_with_error.dart';

class EditorsPickRow extends StatefulWidget {
  const EditorsPickRow({super.key});

  @override
  State<EditorsPickRow> createState() => _EditorsPickRowState();
}

class _EditorsPickRowState extends State<EditorsPickRow> {
  final PlaylistService _playlistService = PlaylistService();
  List<PlaylistApiModel> _playlists = [];
  bool _isLoading = false;
  String _error = "";

  @override
  void initState() {
    super.initState();
    fetchPlaylists();
  }

  Future<void> fetchPlaylists() async {
    try {
      final response = await _playlistService.fetchPlaylists();
      final data = response.data as List;
      setState(() {
        _playlists = data
            .map((json) => PlaylistApiModel.fromJson(json))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
            ),
          )
        : _error.isNotEmpty
        ? FailedToLoadWithError(
            error: _error,
            fetchingItem: "Album",
            onRetry: fetchPlaylists,
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _playlists.map((data) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PlaylistDetailScreen(playlistCover: data.imageURL),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: _Card(
                      imageUrl: data.imageURL,
                      description: data.title,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
  }
}

class _Card extends StatelessWidget {
  final String imageUrl;
  final String? description;

  const _Card({required this.imageUrl, this.description});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl, height: 120, width: 120),
        SizedBox(height: 4),
        SizedBox(
          width: 120,
          child: Text(
            description ?? "",
            maxLines: 2,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
