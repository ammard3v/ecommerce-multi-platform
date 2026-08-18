import '../../../features/shop/home/home.dart';
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key,
      required this.title,
      this.message,
      this.confirmText = "Yes, Remove",
      required this.onConfirm,
      required this.cancelText,
      this.onCancel,
      this.confirmColor,
      this.cancelColor});
  final String title;
  final String? message;
  final String confirmText;
  final VoidCallback onConfirm;
  final String cancelText;
  final VoidCallback? onCancel;
  final Color? confirmColor;
  final Color? cancelColor;
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Container(
      height: 210,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      decoration: BoxDecoration(
        color: dark ? AppColors.darkBackground : AppColors.lightBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSizes.defaultSpace),
          Divider(
            height: 2,
            color: Colors.grey[300],
            thickness: 1,
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child:
                    MainButton(radius: 30, text: cancelText, onTap: onCancel),
              ),
              SizedBox(width: AppSizes.xs),
              Expanded(
                child: MainButton(
                    backgroundColor: AppColors.error.withValues(alpha: .9),
                    radius: 30,
                    text: confirmText,
                    onTap: onConfirm),
              ),
            ],
          ),
        ],
      ),
    );
  }
}