import 'package:flutter/material.dart';

class ContinueWithBrandButton extends StatelessWidget {
  final String brand;
  final String iconPath;
  const ContinueWithBrandButton({
    required this.brand,
    required this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: BoxBorder.all(color: Colors.white),
        ),
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(iconPath, width: 20, height: 20),
            Text(
              'Continue with $brand',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(".", style: TextStyle(color: Color.fromRGBO(12, 12, 12, 1))),
          ],
        ),
      ),
    );
  }
}
