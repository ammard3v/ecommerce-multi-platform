import '../../../features/shop/home/home.dart';
class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.icon = Icons.favorite_rounded,
    this.size = AppSizes.md,
    this.backgroundColor,
    this.onPressed,
    this.height,
    this.width,
    this.color,
  });
  final double? width, height, size;
  final IconData? icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: (backgroundColor != null)
            ? backgroundColor
            : dark
                ? AppColors.darkBackground.withValues(alpha: 0.9)
                : AppColors.lightBackground.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(100),
        boxShadow: boxShadowCustom,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}