import 'dart:async';

import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

class VolumeSlider extends StatefulWidget {
  final bool showSystemUI;
  final double iconSize;

  const VolumeSlider({
    super.key,
    this.showSystemUI = true,
    this.iconSize = 24.0,
  });

  @override
  VolumeSliderState createState() => VolumeSliderState();
}

class VolumeSliderState extends State<VolumeSlider> {
  double _volume = 0.0;
  double _previousVolume = 0.5;
  late final StreamSubscription<double> _subscription;

  @override
  void initState() {
    super.initState();
    VolumeController.instance.showSystemUI = widget.showSystemUI;

    _subscription = VolumeController.instance.addListener((vol) {
      if (mounted) {
        setState(() {
          if (_volume > 0) {
            _previousVolume = _volume;
          }
          _volume = vol;
        });
      }
    }, fetchInitialVolume: true);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _toggleMute() {
    if (_volume > 0) {
      VolumeController.instance.setVolume(0.0);
    } else {
      VolumeController.instance.setVolume(
        _previousVolume > 0 ? _previousVolume : 0.5,
      );
    }
  }

  IconData _getVolumeIcon() {
    if (_volume == 0) {
      return Icons.volume_off;
    } else if (_volume < 0.3) {
      return Icons.volume_mute;
    } else if (_volume < 0.7) {
      return Icons.volume_down;
    } else {
      return Icons.volume_up;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: _toggleMute,
          child: Icon(
            _getVolumeIcon(),
            size: widget.iconSize,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Slider(
            value: _volume,
            activeColor: Theme.of(context).primaryColor,
            min: 0,
            max: 1,
            onChanged: (val) {
              VolumeController.instance.setVolume(val);
            },
          ),
        ),
      ],
    );
  }
}
