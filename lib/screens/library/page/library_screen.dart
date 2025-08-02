import 'package:flutter/material.dart';
import 'package:spotify_app/widgets/footer.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [Footer(selectedTab: "library")]),
      ),
    );
  }
}
