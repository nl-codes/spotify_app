import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged? onSubmitted;
  final String? hintText;
  final bool obscureText;
  final TextInputAction? textInputAction;
  const CustomTextfield({
    this.controller,
    super.key,
    this.hintText,
    this.obscureText = false,
    this.textInputAction,
    this.onSubmitted,
  });

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
          onSubmitted: onSubmitted,
          textInputAction: textInputAction,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
