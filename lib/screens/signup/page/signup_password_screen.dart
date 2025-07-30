import 'package:flutter/material.dart';
import 'package:spotify_app/screens/signup/widget/signup_header.dart';
import 'package:spotify_app/widgets/button/green_button.dart';

class SignupPasswordScreen extends StatelessWidget {
  const SignupPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8.0, 16, 0),
          child: Column(
            children: [
              SignupHeader(
                text: "Create a password",
                description: "Use atlease 8 characters",
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GreenButton(isActive: true, gotoPath: '/signup/name'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
