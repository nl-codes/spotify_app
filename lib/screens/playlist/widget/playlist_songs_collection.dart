import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/song_api_model.dart';
import 'package:spotify_app/screens/playlist/widget/playlist_song_card.dart';

class PlaylistSongsCollection extends StatelessWidget {
  final List<SongApiModel> songList;
  const PlaylistSongsCollection({super.key, required this.songList});

  @override
  Widget build(BuildContext context) {
    final int maxSongs = 5;
    final int itemCount = songList.length > maxSongs
        ? maxSongs
        : songList.length;

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final song = songList[index];
        return PlaylistSongCard(
          imageUrl: song.imageURL,
          title: song.title,
          artist: song.artist,
        );
      },
    );
  }
}
