import 'package:flutter/material.dart';
import 'package:spotify_app/screens/home/widgets/now_playing_bar.dart';
import 'package:spotify_app/screens/search/widget/genre_cards_list.dart';
import 'package:spotify_app/screens/search/widget/search_header.dart';
import 'package:spotify_app/widgets/custom_searchbar.dart';
import 'package:spotify_app/widgets/footer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: Column(
                  children: [
                    SearchHeader(),
                    CustomSearchbar(hintText: "Artists, Songs, Playlists..."),
                    SizedBox(height: 32),
                    Expanded(child: GenreCardsList()),
                  ],
                ),
              ),
            ),
            NowPlayingBar(),
            Footer(selectedTab: "search"),
          ],
        ),
      ),
    );
  }
}
