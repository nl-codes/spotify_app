import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_app/screens/login/page/login_screen.dart';
import 'package:spotify_app/screens/preference/artists/page/choose_artists_screen.dart';
import 'package:spotify_app/screens/preference/podcast/page/choose_podcast_screen.dart';
import 'package:spotify_app/screens/root/page/root_screen.dart';
import 'package:spotify_app/screens/signup/page/signup_email_screen.dart';
import 'package:spotify_app/screens/signup/page/signup_name_screen.dart';
import 'package:spotify_app/screens/signup/page/signup_password_screen.dart';
import 'package:spotify_app/screens/splash/page/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify App',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromRGBO(18, 18, 18, 1),
        primaryColor: Color.fromRGBO(30, 215, 96, 1),
        hintColor: Color.fromRGBO(18, 18, 18, 1),
        hoverColor: Color.fromRGBO(119, 119, 119, 1),
        textTheme: GoogleFonts.averiaSerifLibreTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),

        '/signup/email': (context) => SignupEmailScreen(),
        '/signup/password': (context) => SignupPasswordScreen(),
        '/signup/name': (context) => SignupNameScreen(),

        '/login': (context) => LoginScreen(),

        '/choose/artists': (context) => ChooseArtistsScreen(),
        '/choose/podcasts': (context) => ChoosePodcastScreen(),

        '/root': (context) => RootScreen(),
      },
    );
  }
}
