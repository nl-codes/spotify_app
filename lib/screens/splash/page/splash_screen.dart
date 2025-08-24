import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/screens/splash/widget/continue_with_brand_button.dart';
import 'package:spotify_app/screens/splash/widget/signup_button.dart';
import 'package:spotify_app/states/bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Check authentication status when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().checkAuthStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          // If user is already authenticated, navigate to root and remove all previous routes
          if (state is Authenticated) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/root',
              (route) => false,
            );
          }
        },
        child: Stack(
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
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/signup/email'),
                      child: SignupButton(),
                    ),
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
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/login'),
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
