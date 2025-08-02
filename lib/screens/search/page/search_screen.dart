import 'package:flutter/material.dart';
import 'package:spotify_app/widgets/footer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [Footer(selectedTab: "search")]),
      ),
    );
  }
}
