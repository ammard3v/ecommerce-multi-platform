import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../features/shop/home/home.dart';
class Spinner extends StatelessWidget {
  const Spinner({super.key, this.size = 60.0});
  final double size;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: Center(
        child: RoundedContainer(
          height: double.infinity,
          backgroundColor: AppColors.transparent,
          child: SpinKitCircle(color: AppColors.primary, size: size),
        ),
      ),
    );
  }
}