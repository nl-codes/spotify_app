import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isSelected ? Icons.radio_button_on : Icons.radio_button_off,
        color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
    );
  }
}
