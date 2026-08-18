import 'package:flutter/material.dart';
import 'package:eshop/utils/constants/device_helpers.dart';
class DElevatedButton extends StatelessWidget {
  const DElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });
  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceHelpers.screenWidth(context),
      child: ElevatedButton(onPressed: onPressed, child: child),
    );
  }
}