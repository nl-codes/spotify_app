import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Recently Played",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Row(
          children: [
            Icon(Icons.notifications_outlined),
            SizedBox(width: 16),
            Icon(Icons.timer_outlined),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/setting'),
              child: Icon(Icons.settings_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
