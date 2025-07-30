import 'package:flutter/material.dart';

class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: "Search",
          ),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
