import 'package:flutter/material.dart';

class SimpleSlider extends StatefulWidget {
  const SimpleSlider({super.key});

  @override
  State<SimpleSlider> createState() => _SimpleSliderState();
}

class _SimpleSliderState extends State<SimpleSlider> {
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 2,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
            ),
            child: Slider(
              value: _value,
              activeColor: Colors.white,
              inactiveColor: Colors.grey.shade700,
              min: 0,
              max: 1,
              onChanged: (val) {
                setState(() {
                  _value = val;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
