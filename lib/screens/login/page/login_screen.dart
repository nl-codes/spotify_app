import 'package:flutter/material.dart';
import 'package:spotify_app/screens/login/widget/login_button.dart';
import 'package:spotify_app/widgets/header.dart';
import 'package:spotify_app/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8.0, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(pageTitle: "Log into your account"),
              SizedBox(height: 40),
              Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              CustomTextfield(),
              SizedBox(height: 20),
              Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              CustomTextfield(),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/root'),
                    child: LoginButton(isActive: true),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
