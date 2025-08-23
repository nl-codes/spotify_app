import 'package:flutter/material.dart';

class DownloadButton extends StatefulWidget {
  final bool initialDownloadStatus;
  final double size;

  const DownloadButton({
    super.key,
    this.initialDownloadStatus = false,
    this.size = 24,
  });

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  late bool _downloadStatus;

  @override
  void initState() {
    super.initState();
    _downloadStatus = widget.initialDownloadStatus;
  }

  void _changeStatus() {
    setState(() {
      _downloadStatus = !_downloadStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeStatus,
      child: Icon(
        _downloadStatus
            ? Icons.download_for_offline
            : Icons.download_for_offline_outlined,
        color: _downloadStatus ? Theme.of(context).primaryColor : Colors.grey,
        size: widget.size,
      ),
    );
  }
}
