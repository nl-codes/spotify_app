import 'package:flutter/material.dart';

class SettingProfileBar extends StatelessWidget {
  const SettingProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(
            'https://res.cloudinary.com/duhbs7hqv/image/upload/v1755328895/dazai_ykm8yv.jpg',
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dazai",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text("View Profile", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        Icon(Icons.chevron_right),
      ],
    );
  }
}
