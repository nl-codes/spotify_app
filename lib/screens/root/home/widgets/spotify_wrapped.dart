import 'package:flutter/material.dart';

class SpotifyWrapper extends StatelessWidget {
  const SpotifyWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.network(
              'https://wp-socialnation-assets.s3.ap-south-1.amazonaws.com/wp-content/uploads/2023/12/06235643/2-1-1-1440x960.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#SPOTIFYWRAPPED",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  "Your 2023 in review",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            _Card(
              imageUrl:
                  "https://wrapped-images.spotifycdn.com/image/yts-2023/default/your-top-songs-2023_DEFAULT_en.jpg",
              description: "Your Top Songs 2023",
            ),
            SizedBox(width: 16),
            _Card(
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBWjFAQqLh_d3A2Pw5H3IAlPl6uaj37vNFiA&s",
              description: "Your Artists revealed",
            ),
          ],
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final String imageUrl;
  final String description;

  const _Card({required this.imageUrl, required this.description});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl, height: 120, width: 120),
        SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }
}
