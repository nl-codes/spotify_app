import 'package:flutter/material.dart';

class PlayPauseButton extends StatefulWidget {
  final bool isPlay;

  const PlayPauseButton({super.key, this.isPlay = false});

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
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
        _isPlaying ? Icons.pause : Icons.play_arrow,
        color: Colors.white,
      ),
    );
  }
}
