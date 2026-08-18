import 'package:flutter/material.dart';
import 'clipper/custom_roundedge.dart';
class RoundedEdgesContainer extends StatelessWidget {
  const RoundedEdgesContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomRoundedClipper(),
      child: child,
    );
  }
}