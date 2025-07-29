import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(18, 18, 18, 1),
        ),
        scaffoldBackgroundColor: Color.fromRGBO(18, 18, 18, 1),
        primaryColor: Color.fromRGBO(30, 215, 96, 1),
        textTheme: GoogleFonts.averiaSerifLibreTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {'/': (context) => SplashScreen()},
    );
  }
}
