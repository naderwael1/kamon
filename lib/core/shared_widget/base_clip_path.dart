import 'package:flutter/material.dart';

class BaseClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 10, size.height - 50, size.width / 5, size.height - 50);
    path.lineTo(size.width * 4 / 5, size.height - 50);
    path.quadraticBezierTo(
        size.width * 9 / 10, size.height - 50, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
