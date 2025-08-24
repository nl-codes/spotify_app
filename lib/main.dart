import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:spotify_app/screens/album/page/album_detail_screen.dart';
import 'package:spotify_app/screens/login/page/login_screen.dart';
import 'package:spotify_app/screens/playlist/page/playlist_detail_screen.dart';
import 'package:spotify_app/screens/preference/artists/page/choose_artists_screen.dart';
import 'package:spotify_app/screens/preference/podcast/page/choose_podcast_screen.dart';
import 'package:spotify_app/screens/profile/page/profile_edit_screen.dart';
import 'package:spotify_app/screens/profile/page/profile_view_screen.dart';
import 'package:spotify_app/screens/root/page/root_screen.dart';
import 'package:spotify_app/screens/root/search/page/recent_search_screen.dart';
import 'package:spotify_app/screens/root/search/page/scan_from_camera_screen.dart';
import 'package:spotify_app/screens/setting/page/setting_screen.dart';
import 'package:spotify_app/screens/setting/page/test.dart';
import 'package:spotify_app/screens/signup/page/signup_email_screen.dart';
import 'package:spotify_app/screens/signup/page/signup_name_screen.dart';
import 'package:spotify_app/screens/signup/page/signup_password_screen.dart';
import 'package:spotify_app/screens/splash/page/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('Flutter');
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

        '/search/recent': (context) => RecentSearchScreen(),
        '/search/camera': (context) => ScanFromCameraScreen(),

        '/setting': (context) => SettingScreen(),

        '/profile/view': (context) => ProfileViewScreen(),
        '/profile/edit': (context) => ProfileEditScreen(),

        '/album/detail': (context) => AlbumDetailScreen(albumId: ""),
        '/playlist/detail': (context) =>
            PlaylistDetailScreen(playlistCover: ""),
        '/test': (context) => TestScreen(),
      },
    );
  }
}
