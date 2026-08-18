import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import '../features/order/presentation/pages/barel.dart';
class NoConnection extends StatefulWidget {
  const NoConnection({super.key});
  @override
  State<NoConnection> createState() => _NoConnectionState();
}
class _NoConnectionState extends State<NoConnection> {
  bool _show = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _show = true);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    if (!_show) {
      return const SizedBox();
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/lottie/noInternet.json",
                repeat: true,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
class InternetConnectionHold extends StatelessWidget {
  const InternetConnectionHold({super.key});
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: AppColors.white,
      size: 60.0,
    );
  }
}