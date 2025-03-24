import 'package:flutter/material.dart';

class IconTextColumn extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;
  final VoidCallback onPressed;

  const IconTextColumn({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          color: Colors.white,
          iconSize: 24,
          onPressed: onPressed,
        ),

        Text(
          text1,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: const Color.fromARGB(221, 255, 255, 255),
          ),
        ),

        Text(
          text2,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: const Color.fromARGB(221, 139, 138, 138),
          ),
        ),
      ],
    );
  }
}
