import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final bool isActive;

  const LoginButton({required this.isActive, super.key});

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
          'Log in',
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
