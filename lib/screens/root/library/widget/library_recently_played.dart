import 'package:flutter/material.dart';

class LibraryRecentlyPlayed extends StatelessWidget {
  const LibraryRecentlyPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.compare_arrows_outlined),
            ),
            Text("Recently Played"),
          ],
        ),
        Icon(Icons.grid_view),
      ],
    );
  }
}
