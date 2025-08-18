import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/library_api_model.dart';
import 'package:spotify_app/core/network/library_service.dart';
import 'package:spotify_app/screens/root/home/widgets/now_playing_bar.dart';
import 'package:spotify_app/screens/root/library/widget/library_card_collection.dart';
import 'package:spotify_app/screens/root/library/widget/library_filter_options.dart';
import 'package:spotify_app/screens/root/library/widget/library_header.dart';
import 'package:spotify_app/screens/root/library/widget/library_recently_played.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final LibraryService _libraryService = LibraryService();
  List<LibraryApiModel> _libraryCardLists = [];
  bool _isLoading = false;
  String _error = "";

  @override
  void initState() {
    super.initState();
    fetchLibraryCardsData();
  }

  Future<void> fetchLibraryCardsData() async {
    try {
      final response = await _libraryService.fetchLibraryDetails();
      final data = response.data as List;
      setState(() {
        _libraryCardLists = data
            .map((json) => LibraryApiModel.fromJson(json))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _error.isNotEmpty
                ? Center(child: Text(_error))
                : ListView(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    children: [
                      LibraryHeader(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: LibraryFilterOptions(),
                      ),
                      const SizedBox(height: 16),

                      LibraryRecentlyPlayed(),
                      const SizedBox(height: 16),

                      LibraryCardCollection(
                        libraryCardLists: _libraryCardLists,
                      ),
                    ],
                  ),
          ),
          NowPlayingBar(),
        ],
      ),
    );
  }
}
