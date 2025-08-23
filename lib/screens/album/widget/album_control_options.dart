import 'package:flutter/material.dart';

class AlbumControlOptions extends StatelessWidget {
  final Widget icon;
  final String controllerName;
  const AlbumControlOptions({
    super.key,
    required this.icon,
    required this.controllerName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Row(children: [icon, SizedBox(width: 8), Text(controllerName)]),
    );
  }
}
