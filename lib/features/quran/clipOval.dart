import 'package:flutter/material.dart';

class Oval extends StatelessWidget {
  final double height, width, iconsize;
  final Color iconColor;

  const Oval({
    super.key,
    this.height = 40,
    this.width = 40,
    required this.iconsize,
    required this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: ClipOval(
          child: Icon(
        Icons.play_arrow,
        color: iconColor,
        size: iconsize,
      )),
    );
  }
}
