import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/mixed_avatar_api_model.dart';
import 'package:spotify_app/core/network/mixed_avatar_service.dart';
import 'package:spotify_app/screens/home/widgets/home_header.dart';
import 'package:spotify_app/screens/home/widgets/recently_played_row.dart';
import 'package:spotify_app/screens/home/widgets/spotify_wrapper.dart';
import 'package:spotify_app/widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MixedAvatarService _service = MixedAvatarService();
  List<MixedAvatarApiModel> _recentlyPlayedItems = [];
  bool _isLoading = true;
  String _error = "";

  @override
  void initState() {
    super.initState();
    fetchRecentlyPlayedItems();
  }

  Future<void> fetchRecentlyPlayedItems() async {
    try {
      final response = await _service.fetchMixedAvatar();
      final data = response.data as List;
      setState(() {
        _recentlyPlayedItems = data
            .map((json) => MixedAvatarApiModel.fromJson(json))
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16, 0),
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : _error.isNotEmpty
                    ? Center(child: Text(_error))
                    : ListView(
                        children: [
                          HomeHeader(),
                          const SizedBox(height: 16),
                          RecentlyPlayedRow(
                            recentlyPlayedItems: _recentlyPlayedItems,
                          ),
                          SpotifyWrapper(),
                        ],
                      ),
              ),
            ),
            Footer(selectedTab: "home"),
          ],
        ),
      ),
    );
  }
}
