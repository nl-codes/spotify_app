import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/profile/view'),
      child: ClipOval(
        child: Image.network(
          'https://res.cloudinary.com/duhbs7hqv/image/upload/v1755328895/dazai_ykm8yv.jpg',
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
