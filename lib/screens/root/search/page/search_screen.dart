import 'package:flutter/material.dart';
import 'package:spotify_app/screens/root/home/widgets/now_playing_bar.dart';
import 'package:spotify_app/screens/root/search/widget/genre_cards_list.dart';
import 'package:spotify_app/screens/root/search/widget/search_header.dart';
import 'package:spotify_app/screens/root/search/widget/search_screen_searchbar.dart.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Column(
                children: [
                  SearchHeader(),
                  SizedBox(height: 20),
                  SearchScreenSearchbar(
                    isActive: false,
                    onTap: () => Navigator.pushNamed(context, '/search/recent'),
                  ),
                  SizedBox(height: 32),
                  Expanded(child: GenreCardsList()),
                ],
              ),
            ),
          ),
          NowPlayingBar(),
        ],
      ),
    );
  }
}
