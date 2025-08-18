import 'package:flutter/material.dart';

class SearchScreenSearchbar extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const SearchScreenSearchbar({
    super.key,
    this.onTap,
    this.controller,
    this.focusNode,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? Color.fromRGBO(40, 40, 40, 1) : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onTap: onTap,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: isActive ? "Search" : "Artists, Songs, Playlists...",
          hintStyle: TextStyle(
            color: isActive ? Colors.white70 : Colors.grey[600],
            fontSize: 16,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: isActive ? Colors.white70 : Colors.grey[600],
            size: 24,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
