import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/album_api_model.dart';
import 'package:spotify_app/core/network/album_service.dart';
import 'package:spotify_app/screens/album/page/album_detail_screen.dart';
import 'package:spotify_app/widgets/failed_to_load_with_error.dart';

class JumpBackInRow extends StatefulWidget {
  const JumpBackInRow({super.key});

  @override
  State<JumpBackInRow> createState() => _JumpBackInRowState();
}

class _JumpBackInRowState extends State<JumpBackInRow> {
  final AlbumService _albumService = AlbumService();
  List<AlbumApiModel> _albumLists = [];
  bool _isLoading = false;
  String _error = "";

  @override
  void initState() {
    super.initState();
    fetchAlbums();
  }

  Future<void> fetchAlbums() async {
    try {
      final response = await _albumService.fetchAlbums();
      final data = response.data as List;
      setState(() {
        _albumLists = data.map((json) => AlbumApiModel.fromJson(json)).toList();
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
            onRetry: fetchAlbums,
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _albumLists.map((data) {
                return Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AlbumDetailScreen(albumId: data.albumId),
                      ),
                    ),
                    child: _Card(
                      imageUrl: data.imageURL,
                      title: data.title,
                      author: data.artist,
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
  final String title;
  final String author;

  const _Card({
    required this.imageUrl,
    required this.title,
    required this.author,
  });
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
            title,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(
          width: 120,
          child: Text(
            author,
            maxLines: 1,
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
