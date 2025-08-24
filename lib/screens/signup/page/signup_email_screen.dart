import 'package:flutter/material.dart';
import 'package:spotify_app/screens/signup/page/signup_password_screen.dart';
import 'package:spotify_app/screens/signup/widget/signup_header.dart';
import 'package:spotify_app/states/bloc/auth_bloc.dart';
import 'package:spotify_app/utils/show_custom_snackbar.dart';

class SignupEmailScreen extends StatefulWidget {
  const SignupEmailScreen({super.key});

  @override
  State<SignupEmailScreen> createState() => _SignupEmailScreenState();
}

class _SignupEmailScreenState extends State<SignupEmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  void handleSignup() {
    String email = _emailController.text.trim();
    if (email.isEmpty || !isEmailValid(email)) {
      showCustomSnackbar(context, "Invalid Email, Unable to signup");
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPasswordScreen(email: email),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8.0, 16, 0),
          child: Column(
            children: [
              SignupHeader(
                controller: _emailController,
                text: "What's your email?",
                description: "You'll need to confirm this email later",
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: handleSignup,
                    child: IntrinsicWidth(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 20,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
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
