import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marqueer/marqueer.dart';
import 'package:spotify_app/core/model/song_api_model.dart';
import 'package:spotify_app/core/network/song_service.dart';
import 'package:spotify_app/screens/song/page/song_control_screen.dart';
import 'package:spotify_app/screens/song/page/song_share_screen.dart';
import 'package:spotify_app/utils/hextocolor.dart';
import 'package:spotify_app/widgets/button/album_play_pause_button.dart';
import 'package:spotify_app/widgets/button/like_button.dart';
import 'package:spotify_app/widgets/button/repeat_button.dart';
import 'package:spotify_app/widgets/button/shuffle_button.dart';
import 'package:spotify_app/widgets/drawer/select_devices_drawer.dart';
import 'package:spotify_app/widgets/failed_to_load_with_error.dart';
import 'package:spotify_app/widgets/simple_slider.dart';

class SongDetailScreen extends StatefulWidget {
  final String songId;

  const SongDetailScreen({super.key, required this.songId});

  @override
  State<SongDetailScreen> createState() => _SongDetailScreenState();
}

class _SongDetailScreenState extends State<SongDetailScreen> {
  final SongService _service = SongService();
  late SongApiModel _song;

  bool _isLoading = true;
  String _error = "";

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  Future<void> fetchSongs() async {
    setState(() {
      _isLoading = true;
      _error = "";
    });

    try {
      final response = await _service.fetchSongById(widget.songId);
      final data = response.data;
      setState(() {
        _song = SongApiModel.fromJson(data);
        _isLoading = false;
      });
    } catch (e) {
      print(e);
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
            fetchingItem: "Song",
            onRetry: fetchSongs,
          )
        : Scaffold(
            backgroundColor: Color.fromRGBO(15, 21, 54, 1),
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(15, 21, 54, 1),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text(_song.title),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SongControlScreen(
                          coverUrl: _song.imageURL,
                          songTitle: _song.title,
                          artistName: "Hozier",
                          color: "0f1536",
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.more_horiz, color: Colors.white, size: 28),
                ),
              ],
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [hexToColor("0f1536"), Color.fromRGBO(0, 0, 0, 1)],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Image.network(
                        _song.imageURL,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 55),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 250,
                                child: Marqueer(
                                  pps: 30,
                                  direction: MarqueerDirection.rtl,
                                  infinity: true,
                                  interaction: false,
                                  restartAfterInteraction: true,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "${_song.title}            ",
                                      style: GoogleFonts.averiaSerifLibre(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                _song.artist,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          LikeButton(size: 30),
                        ],
                      ),
                      SizedBox(height: 20),
                      SimpleSlider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("00:00", style: TextStyle(color: Colors.grey)),
                          Text("04:23", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Row(
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
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => showSelectDevices(context),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.bluetooth,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  "Narayan's Airpods",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SongShareScreen(
                                        coverUrl: _song.imageURL,
                                        songTitle: _song.title,
                                        artistName: _song.artist,
                                        color: "0f1536",
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.ios_share_outlined),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
