import '../../../features/shop/home/home.dart';
class AppSectionHeadings extends StatelessWidget {
  const AppSectionHeadings({
    super.key,
    this.textColor,
    required this.title,
    this.onPressed,
    this.buttonTitle = AppTexts.seeAll,
    this.showActionButton = true,
  });
  final Color? textColor;
  final String title, buttonTitle;
  final VoidCallback? onPressed;
  final bool showActionButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              onPressed: onPressed,
              child: Text(buttonTitle)),
      ],
    );
  }
}