import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/song_api_model.dart';
import 'package:spotify_app/core/network/song_service.dart';
import 'package:spotify_app/screens/playlist/widget/playlist_header.dart';
import 'package:spotify_app/screens/playlist/widget/playlist_songs_collection.dart';
import 'package:spotify_app/screens/root/home/widgets/now_playing_bar.dart';
import 'package:spotify_app/widgets/button/album_play_pause_button.dart';
import 'package:spotify_app/widgets/button/download_button.dart';
import 'package:spotify_app/widgets/button/like_button.dart';
import 'package:spotify_app/widgets/failed_to_load_with_error.dart';
import 'package:spotify_app/widgets/footer.dart';

class PlaylistDetailScreen extends StatefulWidget {
  final bool isDefault;
  final String playlistCover;

  const PlaylistDetailScreen({
    super.key,
    required this.playlistCover,
    this.isDefault = false,
  });

  @override
  State<PlaylistDetailScreen> createState() => _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends State<PlaylistDetailScreen> {
  final SongService _songService = SongService();
  List<SongApiModel> _songLists = [];
  bool _isLoading = false;
  String _error = "";

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  Future<void> fetchSongs() async {
    widget.isDefault ? print("defualt") : print("not deafult");
    try {
      final response = widget.isDefault
          ? await _songService.fetchSongforDefaults()
          : await _songService.fetchSongsForPlaylist();
      final data = response.data as List;
      setState(() {
        _songLists = data.map((json) => SongApiModel.fromJson(json)).toList();
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
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(15, 21, 54, 1)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.4, 1],
            colors: [
              Color.fromRGBO(15, 21, 54, 1),
              Color.fromRGBO(15, 21, 54, 1),
              Color.fromRGBO(18, 18, 18, 1),
            ],
          ),
        ),
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
                onRetry: fetchSongs,
              )
            : SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PlaylistHeader(),
                              SizedBox(height: 30),
                              Center(
                                child: Image.network(
                                  widget.playlistCover,
                                  height: 225,
                                  width: 225,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "New and approved indie pop. Cover: No Rome",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 16),
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
                                          Image.asset(
                                            "assets/images/logo.png",
                                            width: 20,
                                            height: 20,
                                            fit: BoxFit.cover,
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "Spotify",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "1,225,1535 likes • 6h 18min",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          LikeButton(),
                                          SizedBox(width: 16),
                                          DownloadButton(),
                                          SizedBox(width: 16),
                                          Icon(
                                            Icons.more_horiz,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                    ],
                                  ),
                                  AlbumPlayPauseButton(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              PlaylistSongsCollection(songList: _songLists),
                            ],
                          ),
                        ),
                      ),
                    ),
                    NowPlayingBar(),
                    Footer(selectedTab: "library"),
                  ],
                ),
              ),
      ),
    );
  }
}
