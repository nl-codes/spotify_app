import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final bool isActive;
  final String gotoPath;
  const GreenButton({
    required this.gotoPath,
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          return;
        }
        Navigator.pushNamed(context, gotoPath);
      },
      child: IntrinsicWidth(
        child: Container(
          decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).primaryColor
                : Color.fromRGBO(83, 83, 83, 1),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          alignment: Alignment.center,
          child: Text(
            'Next',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
