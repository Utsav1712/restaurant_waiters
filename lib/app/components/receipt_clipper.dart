import 'package:flutter/material.dart';

class ReceiptClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double zigZagWidth = 24;
    const double zigZagHeight = 10;
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height - zigZagHeight);

    // Create zig-zag bottom
    for (double i = 0; i < size.width; i += zigZagWidth) {
      path.lineTo(i + zigZagWidth / 2, size.height);
      path.lineTo(i + zigZagWidth, size.height - zigZagHeight);
    }

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
