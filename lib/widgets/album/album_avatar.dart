import 'package:flutter/material.dart';
import 'package:spotify_app/screens/album/page/album_detail_screen.dart';

class AlbumAvatar extends StatelessWidget {
  final String imageURL;
  final String fullName;
  final String albumId;
  const AlbumAvatar({
    super.key,
    required this.imageURL,
    required this.fullName,
    required this.albumId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlbumDetailScreen(albumId: albumId),
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
