import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:spotify_app/screens/signup/widget/signup_header.dart';

class SignupNameScreen extends StatelessWidget {
  const SignupNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("Flutter");
    final TextEditingController usernameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8.0, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignupHeader(
                  controller: usernameController,
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
                  description: "Please send me news and offer from Spotify.",
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
                      onTap: () {
                        box.put("username", usernameController.text.trim());
                        Navigator.pushNamed(context, '/choose/artists');
                      },
                      child: _CreateAcccountButton(isActive: false),
                    ),
                  ],
                ),
              ],
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
              setState(() {
                isChecked = !isChecked;
              });
            },
          ),
        ),
      ],
    );
  }
}

class _CreateAcccountButton extends StatelessWidget {
  final bool isActive;

  const _CreateAcccountButton({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : Colors.white,
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
