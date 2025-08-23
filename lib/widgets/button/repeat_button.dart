import 'package:flutter/material.dart';

class RepeatButton extends StatefulWidget {
  const RepeatButton({super.key});

  @override
  State<RepeatButton> createState() => _RepeatButtonState();
}

class _RepeatButtonState extends State<RepeatButton> {
  int repeatCounter = 0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          repeatCounter = (repeatCounter + 1) % 3;
        });
      },
      color: repeatCounter == 0 ? Colors.grey : Theme.of(context).primaryColor,
      icon: Icon(
        repeatCounter == 0
            ? Icons.repeat
            : repeatCounter == 1
            ? Icons.repeat_on
            : Icons.repeat_one,
      ),
    );
  }
}
