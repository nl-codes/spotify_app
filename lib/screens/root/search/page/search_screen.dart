import 'package:flutter/material.dart';
import 'package:spotify_app/screens/root/home/widgets/now_playing_bar.dart';
import 'package:spotify_app/screens/root/search/widget/genre_cards_list.dart';
import 'package:spotify_app/screens/root/search/widget/search_header.dart';
import 'package:spotify_app/screens/root/search/widget/recent_search_list.dart';
import 'package:spotify_app/screens/root/search/widget/search_screen_searchbar.dart.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _showRecentSearches = false;

  void _onSearchBarTapped() {
    setState(() {
      _showRecentSearches = true;
    });
  }

  void _onCancelPressed() {
    _searchFocusNode.unfocus();
    setState(() {
      _showRecentSearches = false;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

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
                  // Show SearchHeader only when not showing recent searches
                  if (!_showRecentSearches) SearchHeader(),
                  if (!_showRecentSearches) SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: SearchScreenSearchbar(
                          isActive: _showRecentSearches,
                          onTap: _onSearchBarTapped,
                          controller: _searchController,
                          focusNode: _searchFocusNode,
                        ),
                      ),
                      if (_showRecentSearches) ...[
                        SizedBox(width: 12),
                        TextButton(
                          onPressed: _onCancelPressed,
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),

                  SizedBox(height: 32),

                  Expanded(
                    child: _showRecentSearches
                        ? RecentSearchList()
                        : GenreCardsList(),
                  ),
                ],
              ),
            ),
          ),
          _showRecentSearches ? SizedBox.shrink() : NowPlayingBar(),
        ],
      ),
    );
  }
}
