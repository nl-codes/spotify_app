import 'package:flutter/material.dart';
import 'package:spotify_app/screens/setting/widget/setting_option_title.dart';
import 'package:spotify_app/screens/setting/widget/setting_profile_bar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> settingOptions = [
      "Account",
      "Data Saver",
      "Languages",
      "Playback",
      "Explicit Content",
      "Devices",
      "Car",
      "Social",
      "Voice Assistant & Apps",
      "Audio Quality",
      "Storage",
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Settings"), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SettingProfileBar(),
                SizedBox(height: 32),
                ...settingOptions.map(
                  (option) => SettingOptionTitle(option: option),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
