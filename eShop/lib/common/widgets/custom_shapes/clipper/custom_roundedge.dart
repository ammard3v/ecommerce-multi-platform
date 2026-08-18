import 'package:flutter/material.dart';
class CustomRoundedClipper extends CustomClipper<Path> {
  final double radius;
  CustomRoundedClipper({this.radius = 40});
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h - radius);
    path.quadraticBezierTo(w, h, w - radius, h);
    path.lineTo(radius, h);
    path.quadraticBezierTo(0, h, 0, h - radius);
    path.lineTo(0, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}