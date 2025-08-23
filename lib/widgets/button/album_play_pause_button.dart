import 'package:flutter/material.dart';

class AlbumPlayPauseButton extends StatefulWidget {
  final bool isPlay;
  final Color color;

  const AlbumPlayPauseButton({
    super.key,
    this.isPlay = false,
    required this.color,
  });

  @override
  State<AlbumPlayPauseButton> createState() => _AlbumPlayPauseButtonState();
}

class _AlbumPlayPauseButtonState extends State<AlbumPlayPauseButton> {
  late bool _isPlaying;

  @override
  void initState() {
    super.initState();
    _isPlaying = widget.isPlay;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPlaying = !_isPlaying;
        });
      },
      child: Icon(
        _isPlaying ? Icons.pause_circle : Icons.play_circle,
        size: 60,
        color: widget.color,
      ),
    );
  }
}
