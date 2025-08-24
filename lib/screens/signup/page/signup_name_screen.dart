import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:spotify_app/screens/signup/widget/signup_header.dart';
import 'package:spotify_app/states/bloc/auth_bloc.dart';
import 'package:spotify_app/utils/show_custom_snackbar.dart';

class SignupNameScreen extends StatefulWidget {
  final String email;
  final String password;
  const SignupNameScreen({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  State<SignupNameScreen> createState() => _SignupNameScreenState();
}

class _SignupNameScreenState extends State<SignupNameScreen> {
  var box = Hive.box("Flutter");
  final TextEditingController _usernameController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8.0, 16, 0),
          child: SingleChildScrollView(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                switch (state) {
                  case AuthError error:
                    if (mounted) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                    showCustomSnackbar(context, error.message);

                  case AuthLoading _:
                    if (mounted) {
                      setState(() {
                        isLoading = true;
                      });
                    }

                  case Authenticated state:
                    if (mounted) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                    showCustomSnackbar(
                      context,
                      "Account created: ${state.user.email}!",
                    );
                    // Navigate to next page only on successful signup
                    Navigator.pushNamed(context, '/choose/artists');

                  case Unauthenticated _:
                    if (mounted) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                }
              },
              builder: (context, asyncSnapshot) {
                final authCubit = context.read<AuthCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SignupHeader(
                      controller: _usernameController,
                      text: "What's your name?",
                      description: "This appears on your spotify profile",
                    ),
                    SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).hoverColor),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "By tapping on \"Create account\", you agree to the spotify Terms of Use.",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Terms of Use",
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "To learn more about how spotify collect, uses, shares and protects personal data, Please see the Spotify Privacy Policy",
                      style: TextStyle(fontSize: 12),
                    ),

                    SizedBox(height: 16),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    SizedBox(height: 16),
                    _UserCheckBox(
                      description:
                          "Please send me news and offer from Spotify.",
                    ),

                    SizedBox(height: 16),
                    _UserCheckBox(
                      description:
                          "Share my registration data with spotify's content providers for marketing purpose.",
                    ),
                    SizedBox(height: 120),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: isLoading
                              ? null
                              : () {
                                  // Validate username input
                                  if (_usernameController.text.trim().isEmpty) {
                                    showCustomSnackbar(
                                      context,
                                      "Please enter your name",
                                    );
                                    return;
                                  }

                                  // Store username in Hive
                                  box.put(
                                    "username",
                                    _usernameController.text.trim(),
                                  );

                                  // Trigger signup using the app-level AuthCubit
                                  authCubit.signUp(
                                    widget.email,
                                    widget.password,
                                  );
                                },
                          child: _CreateAcccountButton(),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _UserCheckBox extends StatefulWidget {
  final String description;

  const _UserCheckBox({required this.description});

  @override
  State<_UserCheckBox> createState() => _UserCheckBoxState();
}

class _UserCheckBoxState extends State<_UserCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(widget.description, style: TextStyle(fontSize: 12)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: isChecked
                ? Icon(Icons.check_box, color: Theme.of(context).primaryColor)
                : Icon(
                    Icons.check_box_outline_blank,
                    color: Theme.of(context).primaryColor,
                  ),
            onPressed: () {
              if (mounted) {
                setState(() {
                  isChecked = !isChecked;
                });
              }
            },
          ),
        ),
      ],
    );
  }
}

class _CreateAcccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        alignment: Alignment.center,
        child: Text(
          'Create an account',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
