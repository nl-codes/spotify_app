import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/album_songs_api_model.dart';
import 'package:spotify_app/core/network/album_songs_service.dart';
import 'package:spotify_app/screens/album/widget/radio_button.dart';
import 'package:spotify_app/widgets/button/album_play_pause_button.dart';
import 'package:spotify_app/widgets/button/repeat_button.dart';
import 'package:spotify_app/widgets/button/shuffle_button.dart';
import 'package:spotify_app/widgets/failed_to_load_with_error.dart';

class AlbumRadioScreen extends StatefulWidget {
  final String albumId;
  const AlbumRadioScreen({super.key, required this.albumId});

  @override
  State<AlbumRadioScreen> createState() => _AlbumRadioScreenState();
}

class _AlbumRadioScreenState extends State<AlbumRadioScreen> {
  final AlbumSongsService _service = AlbumSongsService();
  late AlbumSongsApiModel _album;

  bool _isLoading = true;
  String _error = "";

  @override
  void initState() {
    super.initState();
    fetchAlbums();
  }

  Future<void> fetchAlbums() async {
    setState(() {
      _isLoading = true;
      _error = "";
    });

    try {
      final response = await _service.fetchAlbumDetailsById(widget.albumId);
      final data = response.data;
      setState(() {
        _album = AlbumSongsApiModel.fromJson(data);
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _error = e.toString();
        _isLoading = false;
        _album;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_isLoading ? "" : "Album - ${_album.albumTitle}"),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close_rounded),
        ),
      ),
      body: SafeArea(
        child: _isLoading
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
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Now Playing",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Image.network(
                                  _album.albumURL,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  _album.songs[0].title,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Next From: ${_album.albumTitle}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            ..._album.songs.map((song) {
                              return _SongRadioCard(songName: song.title);
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Playing Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ShuffleButton(),
                      Icon(
                        Icons.arrow_left_sharp,
                        color: Colors.white,
                        size: 80,
                      ),
                      AlbumPlayPauseButton(color: Colors.white),
                      Icon(
                        Icons.arrow_right_sharp,
                        color: Colors.white,
                        size: 80,
                      ),
                      RepeatButton(),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

class _SongRadioCard extends StatelessWidget {
  final String songName;
  const _SongRadioCard({required this.songName});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RadioButton(),
        Expanded(
          child: Text(songName, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.drag_handle_rounded, color: Colors.grey),
        ),
      ],
    );
  }
}
