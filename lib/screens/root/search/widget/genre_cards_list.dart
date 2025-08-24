import 'package:flutter/material.dart';
import 'package:spotify_app/screens/playlist/page/playlist_detail_screen.dart';

class GenreCardsList extends StatelessWidget {
  const GenreCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> genreCardsData = [
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452209/rock_jztl5g.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452208/pop_gjf7la.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452207/podcasts_r1otri.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452206/news_cmzkhd.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452206/music_nmc0z1.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452204/live_events_ck9zxz.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452203/made_for_you_vsighy.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452203/latin_landye.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452203/hiphop_dlrxfl.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452203/discover_zm9el9.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452203/indie_pbfu3j.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452203/comedy_wep6nj.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452202/charts_thkij5.jpg",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/duhbs7hqv/image/upload/v1754452202/upcoming_mfgzyj.jpg",
      },
    ];
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      childAspectRatio: 2 / 1.3,
      children: genreCardsData.map((data) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaylistDetailScreen(
                playlistCover:
                    "https://res.cloudinary.com/duhbs7hqv/image/upload/v1756054712/1600w-jGlDSM71rNM_zmqxhj.webp",
                isDefault: true,
              ),
            ),
          ),
          child: _GenreCard(imageUrl: data["imageUrl"]!),
        );
      }).toList(),
    );
  }
}

class _GenreCard extends StatelessWidget {
  final String imageUrl;
  const _GenreCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        width: MediaQuery.of(context).size.width * 0.4,
        fit: BoxFit.cover,
      ),
    );
  }
}
