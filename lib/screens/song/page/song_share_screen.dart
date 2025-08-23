import 'package:flutter/material.dart';
import 'package:spotify_app/screens/song/widget/share_icon_collections.dart';
import 'package:spotify_app/utils/hextocolor.dart';

class SongShareScreen extends StatelessWidget {
  final String coverUrl;
  final String songTitle;
  final String artistName;
  final String color;
  const SongShareScreen({
    super.key,
    required this.coverUrl,
    required this.songTitle,
    required this.artistName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.8, 0.9],
            colors: [
              hexToColor(color),
              hexToColor(color),
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close),
                            ),
                            Text(
                              "Share",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 28),
                          ],
                        ),
                        SizedBox(height: 50),
                        Image.network(
                          coverUrl,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 40),
                        SizedBox(
                          width: 200,
                          child: Text(
                            songTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              artistName,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [Expanded(child: ShareIconCollections())],
                        ),
                      ],
                    ),
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
