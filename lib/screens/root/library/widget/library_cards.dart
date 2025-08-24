import 'package:flutter/material.dart';
import 'package:spotify_app/screens/album/page/album_detail_screen.dart';
import 'package:spotify_app/screens/playlist/page/playlist_detail_screen.dart';
import 'package:spotify_app/screens/song/page/song_detail_screen.dart';

enum LibraryCardType { defaultType, song, artist, album, podcast }

class LibraryCards extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final LibraryCardType type;

  const LibraryCards({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (type == LibraryCardType.album) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumDetailScreen(albumId: id),
            ),
          );
        } else if (type == LibraryCardType.song) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SongDetailScreen(songId: id),
            ),
          );
        } else if (type == LibraryCardType.defaultType) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaylistDetailScreen(
                playlistCover:
                    "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755334958/liked_icon_pvcs5o.jpg",
              ),
            ),
          );
        }
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: type == LibraryCardType.artist
                ? BorderRadius.circular(100)
                : BorderRadius.circular(4),
            child: Image.network(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  if (type == LibraryCardType.defaultType)
                    Icon(
                      Icons.push_pin,
                      size: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  const SizedBox(width: 4),
                  Text(
                    getFormattedDescription(type, description),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getFormattedDescription(LibraryCardType type, String suffix) {
    switch (type) {
      case LibraryCardType.defaultType:
        return suffix;
      case LibraryCardType.song:
        return "Song • $suffix";
      case LibraryCardType.album:
        return "Album • $suffix";
      case LibraryCardType.artist:
        return "Artist";
      case LibraryCardType.podcast:
        return "Podcast";
    }
  }
}
