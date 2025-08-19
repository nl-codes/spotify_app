import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Search",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/search/camera'),
          child: Icon(Icons.camera_alt_outlined),
        ),
      ],
    );
  }
}
