import 'package:flutter/material.dart';

class FailedToLoadWithError extends StatelessWidget {
  final String error;
  final String fetchingItem;
  final VoidCallback onRetry;
  const FailedToLoadWithError({
    super.key,
    required this.error,
    required this.fetchingItem,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 48),
          SizedBox(height: 8),
          Text(
            "Failed to load $fetchingItem",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Text(
            error,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: Text("Retry")),
        ],
      ),
    );
  }
}
