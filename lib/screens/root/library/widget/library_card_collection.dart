import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/library_api_model.dart';
import 'package:spotify_app/screens/root/library/widget/library_cards.dart';

class LibraryCardCollection extends StatelessWidget {
  final List<LibraryApiModel> libraryCardLists;

  const LibraryCardCollection({required this.libraryCardLists, super.key});

  @override
  Widget build(BuildContext context) {
    final defaultCards = [
      LibraryCards(
        imageUrl:
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755334958/liked_icon_pvcs5o.jpg",
        title: "Liked Songs",
        description: "Playlist • 58 songs",
        type: LibraryCardType.defaultType,
      ),
      SizedBox(height: 16),
      LibraryCards(
        imageUrl:
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1755337450/new_episodes_icon_e169xd.png",
        title: "New Episodes",
        description: "Updated 2 days ago",
        type: LibraryCardType.defaultType,
      ),
    ];

    final fetchedCards = libraryCardLists.map((item) {
      final dataType = item.type.toLowerCase();

      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: dataType == "artist"
            ? LibraryCards(
                imageUrl: item.imageURL,
                title: item.fullName ?? "",
                description: "Artist",
                type: LibraryCardType.artist,
              )
            : dataType == "podcast"
            ? LibraryCards(
                imageUrl: item.imageURL,
                title: item.fullName ?? "",
                description: "Podcast",
                type: LibraryCardType.podcast,
              )
            : dataType == "song"
            ? LibraryCards(
                imageUrl: item.imageURL,
                title: item.title ?? "",
                description: item.artist ?? "",
                type: LibraryCardType.song,
              )
            : LibraryCards(
                imageUrl: item.imageURL,
                title: item.title ?? "",
                description: item.artist ?? "",
                type: LibraryCardType.album,
              ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [...defaultCards, const SizedBox(height: 16), ...fetchedCards],
    );
  }
}
