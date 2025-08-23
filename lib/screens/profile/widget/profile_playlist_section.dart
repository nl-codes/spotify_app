import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/playlist_api_model.dart';
import 'package:spotify_app/core/network/playlist_service.dart';

class ProfilePlaylistSection extends StatefulWidget {
  const ProfilePlaylistSection({super.key});

  @override
  State<ProfilePlaylistSection> createState() => _ProfilePlaylistSectionState();
}

class _ProfilePlaylistSectionState extends State<ProfilePlaylistSection> {
  final PlaylistService _service = PlaylistService();
  List<PlaylistApiModel> _playlists = [];

  bool _isLoading = true;
  String _error = "";

  @override
  void initState() {
    super.initState();
    fetchPlaylists();
  }

  Future<void> fetchPlaylists() async {
    setState(() {
      _isLoading = true;
      _error = "";
    });

    try {
      final response = await _service.fetchPlaylists();
      final data = response.data as List;
      setState(() {
        _playlists = data
            .map((json) => PlaylistApiModel.fromJson(json))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
        _playlists = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Playlists",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 8),

        _isLoading
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(),
                ),
              )
            : _error.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red, size: 48),
                    SizedBox(height: 8),
                    Text(
                      "Failed to load playlists",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _error,
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: fetchPlaylists,
                      child: Text("Retry"),
                    ),
                  ],
                ),
              )
            : Column(
                children: _playlists.map((playlist) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: _PlaylistCard(
                      imageUrl: playlist.imageURL,
                      name: playlist.title,
                      likeCounts: playlist.likes,
                    ),
                  );
                }).toList(),
              ),
      ],
    );
  }
}

class _PlaylistCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String likeCounts;

  const _PlaylistCard({
    required this.imageUrl,
    required this.name,
    required this.likeCounts,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(imageUrl, width: 60, height: 60),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text("$likeCounts likes", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        Icon(Icons.chevron_right, color: Colors.grey),
      ],
    );
  }
}
