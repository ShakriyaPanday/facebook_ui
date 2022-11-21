import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconsize;
  final VoidCallback onpressed;

  const CircleButton(
      {super.key,
      required this.icon,
      required this.iconsize,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onpressed,
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        iconSize: iconsize,
      ),
    );
  }
}
