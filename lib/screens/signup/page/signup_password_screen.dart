import 'package:flutter/material.dart';
import 'package:spotify_app/screens/signup/page/signup_name_screen.dart';
import 'package:spotify_app/screens/signup/widget/signup_header.dart';
import 'package:spotify_app/utils/show_custom_snackbar.dart';

class SignupPasswordScreen extends StatefulWidget {
  final String email;
  const SignupPasswordScreen({super.key, required this.email});

  @override
  State<SignupPasswordScreen> createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  void handleSingup() {
    String password = _passwordController.text.trim();
    if (password.isEmpty) {
      showCustomSnackbar(context, "Password is empty, Unable to signup");
      return;
    } else if (password.length < 6) {
      showCustomSnackbar(context, "Password too short, Unable to signup");
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SignupNameScreen(email: widget.email, password: password),
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
                controller: _passwordController,
                text: "Create a password",
                description: "Use at least 6 characters",
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: handleSingup,
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
