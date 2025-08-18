import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/mixed_avatar_api_model.dart';
import 'package:spotify_app/core/network/mixed_avatar_service.dart';
import 'package:spotify_app/screens/root/home/widgets/editors_pick_row.dart';
import 'package:spotify_app/screens/root/home/widgets/home_header.dart';
import 'package:spotify_app/screens/root/home/widgets/jump_back_in_row.dart';
import 'package:spotify_app/screens/root/home/widgets/now_playing_bar.dart';
import 'package:spotify_app/screens/root/home/widgets/recently_played_row.dart';
import 'package:spotify_app/screens/root/home/widgets/spotify_wrapped.dart';

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
      final data = response.data as Map<String, dynamic>;

      // Use the helper parser we built
      final items = parseMixedResponse(data);

      setState(() {
        _recentlyPlayedItems = items;
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16, 0),
            child: HomeHeader(),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _error.isNotEmpty
                  ? Center(child: Text(_error))
                  : ListView(
                      children: [
                        RecentlyPlayedRow(
                          recentlyPlayedItems: _recentlyPlayedItems,
                        ),
                        const SizedBox(height: 16),
                        SpotifyWrapper(),
                        const SizedBox(height: 16),
                        Text(
                          "Editor's Pick",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        EditorsPickRow(),
                        SizedBox(height: 16),
                        Text(
                          "Jump back in",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        JumpBackInRow(),
                        const SizedBox(height: 16),
                      ],
                    ),
            ),
          ),
          NowPlayingBar(),
        ],
      ),
    );
  }

  List<MixedAvatarApiModel> parseMixedResponse(Map<String, dynamic> response) {
    List<MixedAvatarApiModel> items = [];

    // parse artists
    if (response['artists'] != null) {
      for (var artist in response['artists']) {
        items.add(MixedAvatarApiModel.fromJson(artist, "artist"));
      }
    }

    // parse podcasts
    if (response['podcasts'] != null) {
      for (var podcast in response['podcasts']) {
        items.add(MixedAvatarApiModel.fromJson(podcast, "podcast"));
      }
    }

    // parse albums
    if (response['albums'] != null) {
      for (var album in response['albums']) {
        items.add(MixedAvatarApiModel.fromJson(album, "album"));
      }
    }

    return items;
  }
}
