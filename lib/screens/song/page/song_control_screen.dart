import 'package:flutter/material.dart';
import 'package:spotify_app/screens/album/widget/album_control_options.dart';
import 'package:spotify_app/utils/hextocolor.dart';

class _OptionItem {
  final Widget icon;
  final String label;

  const _OptionItem({required this.icon, required this.label});
}

class SongControlScreen extends StatefulWidget {
  final String coverUrl;
  final String songTitle;
  final String artistName;
  final String color;
  const SongControlScreen({
    super.key,
    required this.coverUrl,
    required this.songTitle,
    required this.artistName,
    required this.color,
  });

  @override
  State<SongControlScreen> createState() => _SongControlScreenState();
}

class _SongControlScreenState extends State<SongControlScreen> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final List<_OptionItem> options = [
      _OptionItem(
        icon: IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_outlined,
            color: isLiked ? Theme.of(context).primaryColor : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          },
        ),
        label: "Like",
      ),
      _OptionItem(
        icon: IconButton(
          icon: Icon(Icons.remove_circle_outline, color: Colors.grey),
          onPressed: () {},
        ),
        label: "Hide song",
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
          icon: Icon(Icons.playlist_add_rounded, color: Colors.grey),
          onPressed: () {},
        ),
        label: "Add to queue",
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
          icon: Icon(Icons.radio_rounded, color: Colors.grey),
          onPressed: () {},
        ),
        label: "Go to radio",
      ),
      _OptionItem(
        icon: IconButton(
          icon: Icon(Icons.album, color: Colors.grey),
          onPressed: () {},
        ),
        label: "View Album",
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
          icon: Icon(Icons.group_outlined, color: Colors.grey),
          onPressed: () {},
        ),
        label: "Song credits",
      ),
      _OptionItem(
        icon: IconButton(
          icon: Icon(Icons.dark_mode, color: Colors.grey),
          onPressed: () {},
        ),
        label: "Sleep timer",
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
              hexToColor(widget.color),
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
                    widget.coverUrl,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 40),
                  Text(widget.songTitle, style: TextStyle(fontSize: 20)),
                  Text(widget.artistName, style: TextStyle(color: Colors.grey)),
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
