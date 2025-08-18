import 'package:flutter/material.dart';

class RecentSearchList extends StatelessWidget {
  const RecentSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    // Hard-coded recent searches for static design
    final List<String> recentSearches = [
      'Taylor Swift',
      'Lofi Hip Hop',
      'Pop Hits 2024',
      'The Weeknd',
      'Chill Vibes',
      'Rock Classics',
      'Study Music',
      'Ed Sheeran',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Text(
            'Recent searches',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        // Recent searches list
        Expanded(
          child: ListView.builder(
            itemCount: recentSearches.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 4,
                  ),
                  leading: Icon(Icons.history, color: Colors.white70, size: 24),
                  title: Text(
                    recentSearches[index],
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
