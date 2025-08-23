import 'package:flutter/material.dart';

class ShuffleButton extends StatefulWidget {
  const ShuffleButton({super.key});

  @override
  State<ShuffleButton> createState() => _ShuffleButtonState();
}

class _ShuffleButtonState extends State<ShuffleButton> {
  bool isShuffleOn = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isShuffleOn = !isShuffleOn;
        });
      },
      color: isShuffleOn ? Theme.of(context).primaryColor : Colors.grey,
      icon: Icon(isShuffleOn ? Icons.shuffle_on_outlined : Icons.shuffle),
    );
  }
}
