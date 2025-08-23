import 'package:flutter/material.dart';
import 'package:spotify_app/screens/album/widget/album_control_options.dart';
import 'package:spotify_app/utils/hextocolor.dart';

class _OptionItem {
  final Widget icon;
  final String label;

  const _OptionItem({required this.icon, required this.label});
}

class AlbumControlScreen extends StatelessWidget {
  final String coverUrl;
  final String albumTitle;
  final String artistName;
  final String color;
  const AlbumControlScreen({
    super.key,
    required this.coverUrl,
    required this.albumTitle,
    required this.artistName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final List<_OptionItem> options = [
      _OptionItem(
        icon: IconButton(
          icon: Icon(Icons.favorite, color: Colors.grey),
          onPressed: () {},
        ),
        label: "Like",
      ),
      _OptionItem(
        icon: IconButton(
          icon: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.person_outline, color: Colors.grey),
              Positioned(
                bottom: -4,
                right: -4,
                child: Icon(Icons.music_note, size: 16, color: Colors.grey),
              ),
            ],
          ),
          onPressed: () {},
        ),
        label: "View Artist",
      ),
      _OptionItem(
        icon: IconButton(
          icon: Icon(Icons.ios_share_outlined, color: Colors.grey),
          onPressed: () {},
        ),
        label: "Share",
      ),
      _OptionItem(
        icon: IconButton(
          icon: Icon(Icons.favorite, color: Colors.grey),
          onPressed: () {},
        ),
        label: "Like all Songs",
      ),
      _OptionItem(
        icon: IconButton(
          icon: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.music_note_sharp, color: Colors.grey),
              Positioned(
                top: -4,
                left: -4,
                child: Icon(Icons.add, size: 16, color: Colors.grey),
              ),
            ],
          ),
          onPressed: () {},
        ),
        label: "Add to Playlist",
      ),
      _OptionItem(
        icon: IconButton(
          icon: Icon(Icons.add_to_queue_rounded, color: Colors.grey),
          onPressed: () {},
        ),
        label: "Add to queue",
      ),
      _OptionItem(
        icon: IconButton(
          icon: Icon(Icons.radio_rounded, color: Colors.grey),
          onPressed: () {},
        ),
        label: "Go to radio",
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.5, 0.9],
            colors: [
              hexToColor(color),
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.network(
                    coverUrl,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 40),
                  Text(albumTitle, style: TextStyle(fontSize: 20)),
                  Text(artistName, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 20),
                  ...options.map(
                    (option) => AlbumControlOptions(
                      icon: option.icon,
                      controllerName: option.label,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Text(
                      "Close",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
