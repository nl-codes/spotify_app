import 'package:flutter/material.dart';
import 'package:spotify_app/screens/root/home/widgets/now_playing_bar.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Column(children: [Text(":)")]),
            ),
          ),
          NowPlayingBar(),
        ],
      ),
    );
  }
}
