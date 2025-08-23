import 'package:flutter/material.dart';

class SongDetailScreen extends StatelessWidget {
  final String songId;
  final String? albumName;
  const SongDetailScreen({super.key, required this.songId, this.albumName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey),
        ),
      ),
      body: SafeArea(child: Column(children: [Text(songId)])),
    );
  }
}
