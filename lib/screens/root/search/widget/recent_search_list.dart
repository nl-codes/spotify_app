import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/library_api_model.dart';
import 'package:spotify_app/screens/root/library/widget/library_cards.dart';
import 'package:spotify_app/utils/list_manipulate.dart';

class RecentSearchList extends StatelessWidget {
  final List<LibraryApiModel> recentCardLists;

  const RecentSearchList({required this.recentCardLists, super.key});

  @override
  Widget build(BuildContext context) {
    shuffleList(recentCardLists, seed: 10);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: recentCardLists.map((item) {
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
      }).toList(),
    );
  }
}
