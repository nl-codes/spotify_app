import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/library_api_model.dart';
import 'package:spotify_app/screens/root/library/widget/library_cards.dart';
import 'package:spotify_app/screens/root/library/widget/library_filter_options.dart';
import 'package:spotify_app/utils/list_manipulate.dart';

class LibraryCardCollection extends StatelessWidget {
  final FilterOption currentFilter;
  final List<LibraryApiModel> libraryCardLists;

  const LibraryCardCollection({
    required this.libraryCardLists,
    super.key,
    required this.currentFilter,
  });

  @override
  Widget build(BuildContext context) {
    final defaultCards = [
      LibraryCards(
        imageUrl:
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755334958/liked_icon_pvcs5o.jpg",
        title: "Liked Songs",
        description: "Playlist • 58 songs",
        type: LibraryCardType.defaultType,
        id: '',
      ),
      SizedBox(height: 16),
      LibraryCards(
        imageUrl:
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755337450/new_episodes_icon_e169xd.png",
        title: "New Episodes",
        description: "Updated 2 days ago",
        type: LibraryCardType.defaultType,
        id: '',
      ),
    ];

    // ✅ Filter API cards
    shuffleList(libraryCardLists, seed: 37);
    final filteredCards = libraryCardLists
        .where((item) {
          final dataType = item.type.toLowerCase();
          switch (currentFilter) {
            case FilterOption.songs:
              return dataType == "song";
            case FilterOption.artists:
              return dataType == "artist";
            case FilterOption.albums:
              return dataType == "album";
            case FilterOption.podcasts:
              return dataType == "podcast";
            case FilterOption.all:
              return true;
          }
        })
        .map((item) {
          final dataType = item.type.toLowerCase();

          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: dataType == "artist"
                ? LibraryCards(
                    imageUrl: item.imageURL,
                    title: item.fullName ?? "",
                    description: "Artist",
                    type: LibraryCardType.artist,
                    id: '',
                  )
                : dataType == "podcast"
                ? LibraryCards(
                    imageUrl: item.imageURL,
                    title: item.fullName ?? "",
                    description: "Podcast",
                    type: LibraryCardType.podcast,
                    id: '',
                  )
                : dataType == "song"
                ? LibraryCards(
                    imageUrl: item.imageURL,
                    title: item.title ?? "",
                    description: item.artist ?? "",
                    type: LibraryCardType.song,
                    id: '',
                  )
                : LibraryCards(
                    imageUrl: item.imageURL,
                    title: item.title ?? "",
                    description: item.artist ?? "",
                    type: LibraryCardType.album,
                    id: item.id,
                  ),
          );
        })
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: currentFilter == FilterOption.all
          ? [...defaultCards, const SizedBox(height: 16), ...filteredCards]
          : [...filteredCards],
    );
  }
}
