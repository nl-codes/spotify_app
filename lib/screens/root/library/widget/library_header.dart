import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:spotify_app/widgets/profile_icon.dart';

class LibraryHeader extends StatelessWidget {
  const LibraryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('Flutter');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileIcon(),
              SizedBox(width: 12),
              Text(
                "${box.get("username") ?? "Your"}'s Profile",
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
