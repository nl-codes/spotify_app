import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marqueer/marqueer.dart';
import 'package:spotify_app/screens/album/page/album_radio_screen.dart';
import 'package:spotify_app/screens/song/page/song_control_screen.dart';
import 'package:spotify_app/screens/song/page/song_share_screen.dart';
import 'package:spotify_app/utils/hextocolor.dart';
import 'package:spotify_app/widgets/button/album_play_pause_button.dart';
import 'package:spotify_app/widgets/button/like_button.dart';
import 'package:spotify_app/widgets/button/repeat_button.dart';
import 'package:spotify_app/widgets/button/shuffle_button.dart';
import 'package:spotify_app/widgets/simple_slider.dart';

class AlbumSongDetailScreen extends StatelessWidget {
  final String albumId;
  final String albumCover;
  final String albumName;
  final String artistName;
  final String songName;
  final String color;
  final String duration;

  const AlbumSongDetailScreen({
    super.key,
    required this.albumName,
    required this.albumCover,
    required this.artistName,
    required this.songName,
    required this.color,
    required this.duration,
    required this.albumId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor(color),
      appBar: AppBar(
        backgroundColor: hexToColor(color),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(albumName),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongControlScreen(
                    coverUrl: albumCover,
                    songTitle: songName,
                    artistName: artistName,
                    color: color,
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
            colors: [hexToColor(color), Color.fromRGBO(0, 0, 0, 1)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Image.network(
                  albumCover,
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
                                text: "$songName            ",
                                style: GoogleFonts.averiaSerifLibre(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(artistName, style: TextStyle(color: Colors.grey)),
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
                    Text(duration, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Row(
                  children: [
                    ShuffleButton(),
                    Icon(Icons.arrow_left_sharp, color: Colors.white, size: 80),
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
                    Row(
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
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SongShareScreen(
                                  coverUrl: albumCover,
                                  songTitle: songName,
                                  artistName: artistName,
                                  color: color,
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.ios_share_outlined),
                        ),
                        IconButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AlbumRadioScreen(albumId: albumId),
                            ),
                          ),
                          icon: Icon(Icons.playlist_add_rounded),
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
