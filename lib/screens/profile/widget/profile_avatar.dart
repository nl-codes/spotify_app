import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  const ProfileAvatar({
    super.key,
    this.imageHeight = 120,
    this.imageWidth = 120,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        'https://res.cloudinary.com/duhbs7hqv/image/upload/v1755328895/dazai_ykm8yv.jpg',
        height: imageHeight,
        width: imageWidth,
        fit: BoxFit.cover,
      ),
    );
  }
}
