import 'package:flutter/material.dart';
import 'package:spotify_app/screens/song/page/song_detail_screen.dart';

class SongAvatar extends StatelessWidget {
  final String imageURL;
  final String fullName;
  final String songId;
  const SongAvatar({
    super.key,
    required this.imageURL,
    required this.fullName,
    required this.songId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongDetailScreen(songId: songId),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageURL,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 80,
            child: Text(
              textAlign: TextAlign.center,
              fullName,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}
