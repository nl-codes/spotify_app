import 'package:flutter/material.dart';
import 'package:spotify_app/core/model/mixed_avatar_api_model.dart';
import 'package:spotify_app/widgets/artists/artists_avatar.dart';
import 'package:spotify_app/widgets/podcasts/podcast_avatar.dart';

class RecentlyPlayedRow extends StatelessWidget {
  final List<MixedAvatarApiModel> recentlyPlayedItems;

  const RecentlyPlayedRow({required this.recentlyPlayedItems, super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(recentlyPlayedItems.length, (index) {
          final item = recentlyPlayedItems[index];
          final widget = item.type.toLowerCase() == "artist"
              ? ArtistsAvatar(imageURL: item.imageURL, fullName: item.fullName)
              : PodcastAvatar(imageURL: item.imageURL, fullName: item.fullName);

          return Padding(padding: EdgeInsets.only(right: 24.0), child: widget);
        }),
      ),
    );
  }
}
