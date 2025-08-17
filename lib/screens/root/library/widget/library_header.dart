import 'package:flutter/material.dart';
import 'package:spotify_app/widgets/profile_icon.dart';

class LibraryHeader extends StatelessWidget {
  const LibraryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileIcon(),
              SizedBox(width: 12),
              Text(
                "Your Profile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(Icons.add),
        ],
      ),
    );
  }
}
