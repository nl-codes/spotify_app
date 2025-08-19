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
    // If not active, show as a tappable container (for SearchScreen)
    if (!isActive) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey[600], size: 24),
              SizedBox(width: 12),
              Text(
                "Artists, Songs, Playlists...",
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    // If active, show as a real TextField (for RecentSearchScreen)
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(40, 40, 40, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white70, fontSize: 16),
          prefixIcon: Icon(Icons.search, color: Colors.white70, size: 24),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
