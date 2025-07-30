import 'package:flutter/material.dart';
import 'package:spotify_app/widgets/custom_textfield.dart';

class SignupHeader extends StatelessWidget {
  final String text;
  final String? description;
  const SignupHeader({required this.text, this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.all(4),
                child: Icon(Icons.chevron_left),
              ),
            ),
            Text(
              "Create account",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(".", style: TextStyle(color: Theme.of(context).hintColor)),
          ],
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        CustomTextfield(),
        SizedBox(height: 4),
        Text(description ?? "", style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
