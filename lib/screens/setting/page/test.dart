import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Drawer Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showBottomDrawer(context),
          child: Text('Open Bottom Drawer'),
        ),
      ),
    );
  }

  void _showBottomDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to take more space
      backgroundColor: Colors.transparent, // For rounded corners
      isDismissible: true, // Allow dismissing by tapping outside
      enableDrag: true, // Enable drag to dismiss
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8, // Initial height (80% of screen)
          minChildSize: 0.8, // Minimum height (80% of screen) - same as initial
          maxChildSize: 0.8, // Maximum height (80% of screen) - same as initial
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Drag handle
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                  // Content
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.star),
                          title: Text('Item ${index + 1}'),
                          subtitle: Text('This is item number ${index + 1}'),
                          onTap: () {
                            // Handle item tap
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
