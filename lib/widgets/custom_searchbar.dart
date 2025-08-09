import 'package:flutter/material.dart';

class CustomSearchbar extends StatelessWidget {
  final String hintText;
  const CustomSearchbar({this.hintText = "Search", super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
