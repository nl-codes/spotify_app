import 'package:flutter/material.dart';

class ArtistsAvatar extends StatelessWidget {
  final String imageURL;
  final String fullName;
  const ArtistsAvatar({
    super.key,
    required this.imageURL,
    required this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(radius: 40, foregroundImage: NetworkImage(imageURL)),
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
