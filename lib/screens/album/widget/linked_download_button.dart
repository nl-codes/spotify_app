import 'package:flutter/material.dart';

class LinkedDownloadButton extends StatelessWidget {
  final bool downloadStatus;
  final double size;

  const LinkedDownloadButton({
    super.key,
    required this.downloadStatus,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      downloadStatus
          ? Icons.download_for_offline
          : Icons.download_for_offline_outlined,
      color: downloadStatus ? Theme.of(context).primaryColor : Colors.grey,
      size: size,
    );
  }
}
