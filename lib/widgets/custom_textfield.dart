import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  const CustomTextfield({this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).hoverColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
