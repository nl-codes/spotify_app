import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _MetriCount(metric: "Playlists", value: "23"),
        _MetriCount(metric: "Followers", value: "150"),
        _MetriCount(metric: "Following", value: "100"),
      ],
    );
  }
}

class _MetriCount extends StatelessWidget {
  final String metric;
  final String value;
  const _MetriCount({required this.metric, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(value, style: TextStyle(color: Colors.white)),
        SizedBox(height: 4),
        Text(
          metric.toUpperCase(),
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
