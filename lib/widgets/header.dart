import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String pageTitle;
  const Header({required this.pageTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          pageTitle,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(".", style: TextStyle(color: Theme.of(context).hintColor)),
      ],
    );
  }
}
