import 'package:flutter/material.dart';
import 'package:spotify_app/screens/root/home/widgets/now_playing_bar.dart';
import 'package:spotify_app/screens/root/library/widget/library_filter_options.dart';
import 'package:spotify_app/screens/root/library/widget/library_header.dart';
import 'package:spotify_app/screens/root/library/widget/library_recently_played.dart';
import 'package:spotify_app/screens/root/library/widget/spotify_default_cards.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> defaultCards = [
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755334958/liked_icon_pvcs5o.jpg",
        "title": "Liked Songs",
        "description": "Playlist • 58 songs",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755337450/new_episodes_icon_e169xd.png",
        "title": "New Episodes",
        "description": "Updated 2 days ago",
      },
    ];

    return SafeArea(
      child: Column(
        children: [
          LibraryHeader(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(12, 8, 0, 0),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: LibraryFilterOptions(),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: LibraryRecentlyPlayed(),
                  ),
                  SizedBox(
                    height: 194,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: defaultCards.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final data = defaultCards[index];
                        return SpotifyCard(
                          imageUrl: data["imageUrl"]!,
                          title: data["title"]!,
                          description: data["description"]!,
                        );
                      },
                    ),
                  ),
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
