import 'package:flutter/material.dart';

class PodcastAvatar extends StatelessWidget {
  final String imageURL;
  final String fullName;
  const PodcastAvatar({
    super.key,
    required this.imageURL,
    required this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
