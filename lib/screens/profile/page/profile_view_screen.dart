import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:spotify_app/screens/profile/widget/edit_profile_button.dart';
import 'package:spotify_app/screens/profile/widget/profile_avatar.dart';
import 'package:spotify_app/screens/profile/widget/profile_playlist_section.dart';
import 'package:spotify_app/screens/profile/widget/profile_stats.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("Flutter");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 102, 123, 1),
        elevation: 0,
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [Icon(Icons.more_horiz)],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.3, 0.5],
            colors: [
              Color.fromRGBO(0, 102, 123, 1),
              Color.fromRGBO(0, 47, 56, 1),
              Color.fromRGBO(16, 16, 16, 1),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileAvatar(),
                  SizedBox(height: 15),
                  Text(
                    box.get('username') ?? "username",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                      context,
                      '/profile/edit',
                    ),
                    child: EditProfileButton(),
                  ),
                  SizedBox(height: 30),
                  ProfileStats(),
                  SizedBox(height: 30),
                  ProfilePlaylistSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
