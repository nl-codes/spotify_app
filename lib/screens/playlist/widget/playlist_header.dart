import 'package:flutter/material.dart';

class PlaylistHeader extends StatelessWidget {
  const PlaylistHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _PlaylistSearchbar()),
        SizedBox(width: 8),
        _PlaylistSortButton(),
      ],
    );
  }
}

class _PlaylistSearchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white30,
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        hintText: "Find in playlist",
        hintStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 14),
    );
  }
}

class _PlaylistSortButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text("Sort"),
    );
  }
}
