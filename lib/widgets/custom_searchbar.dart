import 'package:flutter/material.dart';

class CustomSearchbar extends StatelessWidget {
  final VoidCallback? onTap;
  final String hintText;
  const CustomSearchbar({this.hintText = "Search", super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12),
            maintainHintSize: true,
            prefixIcon: Icon(Icons.search, color: Colors.black),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
          ),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
