import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/album_songs_api_model.dart';
import 'package:spotify_app/core/network/album_songs_service.dart';
import 'package:spotify_app/screens/album/widget/album_songs_list.dart';
import 'package:spotify_app/screens/album/widget/linked_download_button.dart';
import 'package:spotify_app/screens/root/home/widgets/now_playing_bar.dart';
import 'package:spotify_app/utils/hextocolor.dart';
import 'package:spotify_app/widgets/button/album_play_pause_button.dart';
import 'package:spotify_app/widgets/button/like_button.dart';
import 'package:spotify_app/widgets/failed_to_load_with_error.dart';

class AlbumDetailScreen extends StatefulWidget {
  final String albumId;
  const AlbumDetailScreen({super.key, required this.albumId});

  @override
  State<AlbumDetailScreen> createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  bool _isDownloaded = false;
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
      appBar: AppBar(
        backgroundColor: _isLoading
            ? Colors.black
            : hexToColor(_album.albumColor),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _isLoading
                  ? Color.fromRGBO(0, 0, 0, 1)
                  : hexToColor(_album.albumColor),
              Color.fromRGBO(0, 0, 0, 1),
            ],
          ),
        ),
        child: SafeArea(
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
                            children: [
                              Image.network(
                                _album.albumURL,
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 28),
                              Row(
                                children: [
                                  Text(
                                    _album.albumTitle,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                            child: Image.network(
                                              _album.artistURL,
                                              width: 20,

                                              height: 20,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            _album.artistName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text(
                                            "Album • ${_album.yearReleased}",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          LikeButton(),
                                          SizedBox(width: 24),
                                          GestureDetector(
                                            onTap: () => setState(() {
                                              _isDownloaded = !_isDownloaded;
                                            }),
                                            child: LinkedDownloadButton(
                                              downloadStatus: _isDownloaded,
                                            ),
                                          ),
                                          SizedBox(width: 24),
                                          Icon(
                                            Icons.more_horiz,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  AlbumPlayPauseButton(),
                                ],
                              ),
                              SizedBox(height: 20),
                              AlbumSongsList(
                                artist: _album.artistName,
                                songsList: _album.songs,
                                isDownloaded: _isDownloaded,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    NowPlayingBar(),
                  ],
                ),
        ),
      ),
    );
  }
}
