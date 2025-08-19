import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/library_api_model.dart';
import 'package:spotify_app/core/network/library_service.dart';
import 'package:spotify_app/screens/root/search/widget/recent_search_list.dart';
import 'package:spotify_app/screens/root/search/widget/search_screen_searchbar.dart.dart';

class RecentSearchScreen extends StatefulWidget {
  const RecentSearchScreen({super.key});

  @override
  RecentSearchScreenState createState() => RecentSearchScreenState();
}

class RecentSearchScreenState extends State<RecentSearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
    fetchLibraryCardsData();
  }

  final LibraryService _libraryService = LibraryService();
  List<LibraryApiModel> _recentCardLists = [];
  bool _isLoading = false;
  String _error = "";

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  Future<void> fetchLibraryCardsData() async {
    try {
      final response = await _libraryService.fetchLibraryDetails();
      final data = response.data as List;
      setState(() {
        _recentCardLists = data
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

  void _onCancelPressed() {
    _searchFocusNode.unfocus();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
          child: Column(
            children: [
              SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: SearchScreenSearchbar(
                      isActive: true,
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                    ),
                  ),
                  SizedBox(width: 12),
                  TextButton(
                    onPressed: _onCancelPressed,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32),

              Expanded(
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : _error.isNotEmpty
                    ? Center(child: Text(_error))
                    : SingleChildScrollView(
                        child: RecentSearchList(
                          recentCardLists: _recentCardLists,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
