import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marqueer/marqueer.dart';

class NowPlayingBar extends StatelessWidget {
  const NowPlayingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 60,
            decoration: BoxDecoration(
              color: Color.fromRGBO(15, 25, 41, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                _NowPlayingSongImage(),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20, child: _NowPlayingSongName()),
                      SizedBox(height: 4),
                      _BluetoothDevice(),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.bluetooth, color: Theme.of(context).primaryColor),
                _PlayPauseButton(isPlay: false),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _ProgressBar(color: Color.fromRGBO(58, 67, 79, 1)),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: _ProgressBar(
              width: MediaQuery.of(context).size.width * 0.5,
              color: Color.fromRGBO(178, 178, 178, 1),
            ),
          ),
        ],
      ),
    );
  }
}

class _NowPlayingSongImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        "https://i.scdn.co/image/ab67616d0000b27371d62ea7ea8a5be92d3c1f62",
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _NowPlayingSongName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Marqueer(
      pps: 30, // pixels/sec scrolling speed
      direction: MarqueerDirection.rtl,
      infinity: true,
      interaction: false, // allows tapping to pause
      restartAfterInteraction: true,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Birds of a Feather • ',
              style: GoogleFonts.averiaSerifLibre(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: 'Billie Eilish            ',
              style: GoogleFonts.averiaSerifLibre(
                color: Colors.grey.shade400,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BluetoothDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.bluetooth, color: Theme.of(context).primaryColor, size: 12),
        Text(
          " Narayan's Airpods",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12),
        ),
      ],
    );
  }
}

class _PlayPauseButton extends StatefulWidget {
  final bool isPlay;

  const _PlayPauseButton({required this.isPlay});

  @override
  State<_PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<_PlayPauseButton> {
  late bool _isPlaying = false;

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

class _ProgressBar extends StatelessWidget {
  final double? width; // null means full width
  final Color color;

  const _ProgressBar({this.width, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        width: width,
        height: 4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
