import 'package:flutter/material.dart';

class SettingOptionTitle extends StatelessWidget {
  final String option;
  final IconData icon;
  const SettingOptionTitle({
    super.key,
    required this.option,
    this.icon = Icons.chevron_right,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(option, style: TextStyle(fontSize: 16)),
          Icon(icon, color: Colors.grey),
        ],
      ),
    );
  }
}
