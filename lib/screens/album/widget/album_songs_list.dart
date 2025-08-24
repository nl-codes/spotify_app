import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/album_songs_api_model.dart';
import 'package:spotify_app/screens/album/widget/linked_download_button.dart';
import 'package:spotify_app/screens/song/page/album_song_detail_screen.dart';

class AlbumSongsList extends StatefulWidget {
  final String albumId;
  final String albumName;
  final String albumCover;
  final String albumColor;
  final String artist;
  final List<Song> songsList;
  final bool isDownloaded;

  const AlbumSongsList({
    super.key,
    required this.albumId,
    required this.songsList,
    required this.isDownloaded,
    required this.artist,
    required this.albumName,
    required this.albumCover,
    required this.albumColor,
  });

  @override
  State<AlbumSongsList> createState() => _AlbumSongsListState();
}

class _AlbumSongsListState extends State<AlbumSongsList> {
  int? selectedSongIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.songsList.length,
      itemBuilder: (context, index) {
        final song = widget.songsList[index];
        final isSelected = selectedSongIndex == index;

        return GestureDetector(
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AlbumSongDetailScreen(
                  albumId: widget.albumId,
                  albumName: widget.albumName,
                  albumCover: widget.albumCover,
                  artistName: widget.artist,
                  songName: song.title,
                  color: widget.albumColor,
                  duration: song.duration,
                ),
              ),
            );
          },
          onTap: () {
            setState(() {
              selectedSongIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (isSelected)
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset(
                                "assets/images/frequency.png",
                                height: 10,
                                width: 20,
                                fit: BoxFit.cover,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          Expanded(
                            child: Text(
                              song.title,
                              style: TextStyle(
                                fontSize: 18,
                                color: isSelected
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          LinkedDownloadButton(
                            downloadStatus: widget.isDownloaded,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            widget.artist,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),
          ),
        );
      },
    );
  }
}
