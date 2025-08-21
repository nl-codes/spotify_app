import 'package:flutter/material.dart';

class SettingOptionTitle extends StatelessWidget {
  final String option;
  const SettingOptionTitle({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(option, style: TextStyle(fontSize: 16)),
          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
