import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/screens/setting/widget/setting_option_title.dart';
import 'package:spotify_app/screens/setting/widget/setting_profile_bar.dart';
import 'package:spotify_app/states/bloc/auth_bloc.dart';
import 'package:spotify_app/utils/show_custom_snackbar.dart';

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
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, asyncSnapshot) {
            final authCubit = context.read<AuthCubit>();
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Column(
                children: [
                  Expanded(
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
                  GestureDetector(
                    onTap: () {
                      authCubit.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
                      showCustomSnackbar(context, "You have been logged out");
                    },
                    child: SettingOptionTitle(
                      option: "Logout",
                      icon: Icons.logout,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
