import 'package:flutter/material.dart';

enum RecentSearchType { song, artist, album, podcast }

class RecentSearchCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final RecentSearchType type;

  const RecentSearchCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: type == RecentSearchType.artist
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
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              getFormattedDescription(type, description),
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  String getFormattedDescription(RecentSearchType type, String suffix) {
    switch (type) {
      case RecentSearchType.song:
        return "Song • $suffix";
      case RecentSearchType.album:
        return "Album • $suffix";
      case RecentSearchType.artist:
        return "Artist";
      case RecentSearchType.podcast:
        return "Podcast";
    }
  }
}
