import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../features/shop/home/home.dart';
class DisabledOverlay extends StatefulWidget {
  const DisabledOverlay({super.key});
  @override
  State<DisabledOverlay> createState() => _DisabledOverlayState();
}
class _DisabledOverlayState extends State<DisabledOverlay> {
  bool isProcessing = false;
  Future<void> _processingPayment() async {
    setState(() => isProcessing = true);
    await Future.delayed(Duration(seconds: 20000));
    setState(() => isProcessing = false);
  }
  @override
  void initState() {
    super.initState();
    _processingPayment();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async => false,
      child: AbsorbPointer(absorbing: isProcessing, child: LoadingPage()),
    );
  }
}
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: AppColors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(
              color: AppColors.white,
              size: 60.0,
            ),
            SizedBox(height: 10),
            Text(AppTexts.processingWait),
          ],
        ),
      ),
    );
  }
}