import '../../../features/shop/home/home.dart';
import 'package:toastification/toastification.dart';
enum ToastType { error, success, info, warning }
class ToastHelper {
  static void show(
    BuildContext context, {
    required String message,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3000),
  }) {
    toastification.dismissAll();
    ToastificationType toastType;
    switch (type) {
      case ToastType.error:
        toastType = ToastificationType.error;
        break;
      case ToastType.success:
        toastType = ToastificationType.success;
        break;
      case ToastType.warning:
        toastType = ToastificationType.warning;
        break;
      case ToastType.info:
        toastType = ToastificationType.info;
        break;
    }
    final isDark = DeviceHelpers.isDarkMode(context);
    toastification.show(
      foregroundColor: isDark ? AppColors.white : AppColors.black,
      context: context,
      type: toastType,
      style: ToastificationStyle.flat,
      backgroundColor: isDark ? AppColors.transparent : AppColors.white,
      title: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 2),
      animationBuilder: (context, animation, alignment, child) {
        return ScaleTransition(scale: animation, child: child);
      },
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(100.0),
      dragToClose: true,
      applyBlurEffect: true,
    );
  }
}