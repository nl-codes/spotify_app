import 'package:flutter/material.dart';

class JumpBackInRow extends StatelessWidget {
  const JumpBackInRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Card(
            imageUrl:
                "https://i.scdn.co/image/ab67616d0000b2739e81c165e5ec0802b8eb4e8a",
            title: "Mutu Dekhin (Raw)",
            author: "John Rai",
          ),
          SizedBox(width: 16),
          _Card(
            imageUrl:
                "https://i.scdn.co/image/ab67616d0000b27351c02a77d09dfcd53c8676d0",
            title: "Highway to Hell",
            author: "AC/DC",
          ),
          SizedBox(width: 16),
          _Card(
            imageUrl:
                "https://i.scdn.co/image/ab67616d0000b2737a9bf5f82e32d33d4503fe7b",
            title: "Hozier",
            author: "Hozier",
          ),
          SizedBox(width: 16),
          _Card(
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReLDpZFn-RgnPnIKVbaf1QcHqYedcgHjCxjw&s",
            title: "Strange Trails",
            author: "Lord Huron",
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;

  const _Card({
    required this.imageUrl,
    required this.title,
    required this.author,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl, height: 120, width: 120),
        SizedBox(height: 4),
        SizedBox(
          width: 120,
          child: Text(
            title,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(
          width: 120,
          child: Text(
            author,
            maxLines: 1,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
