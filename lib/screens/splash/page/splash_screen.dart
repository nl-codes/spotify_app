import 'package:flutter/material.dart';
import 'package:spotify_app/screens/splash/widget/continue_with_brand_button.dart';
import 'package:spotify_app/screens/splash/widget/signup_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/images/bg.png',
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 344.0, 12, 0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: 16),
                  Text("Millions of Songs.", style: TextStyle(fontSize: 24)),
                  Text("Free on Spotify.", style: TextStyle(fontSize: 24)),
                  SizedBox(height: 16),
                  SignupButton(),
                  SizedBox(height: 16),
                  ContinueWithBrandButton(
                    brand: "Google",
                    iconPath: "assets/images/google_icon.webp",
                  ),
                  SizedBox(height: 16),
                  ContinueWithBrandButton(
                    brand: "Facebook",
                    iconPath: "assets/images/facebook_icon.webp",
                  ),
                  SizedBox(height: 16),
                  ContinueWithBrandButton(
                    brand: "Apple",
                    iconPath: "assets/images/apple_icon.webp",
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Log in",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
