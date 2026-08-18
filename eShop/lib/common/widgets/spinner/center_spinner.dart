import 'package:flutter/widgets.dart';
import 'spinner.dart';
import '../../../utils/device/device_utility.dart';
class CenterSpinner extends StatelessWidget {
  const CenterSpinner({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtility.screenHeight(context) / 2,
      child: Center(child: Spinner()),
    );
  }
}
class CenterText extends StatelessWidget {
  const CenterText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtility.screenHeight(context) / 2,
      child: Center(child: Text(text)),
    );
  }
}