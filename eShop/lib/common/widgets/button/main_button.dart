import '../spinner/spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.onTap,
    this.text = "",
    this.radius = AppSizes.radiusLarge,
    this.backgroundColor = AppColors.primary,
    this.showText = true,
  });
  final void Function()? onTap;
  final String text;
  final double radius;
  final Color backgroundColor;
  final bool showText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Material(
        shadowColor: AppColors.softGrey,
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          child: Center(
            child: showText
                ? Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(color: AppColors.white),
                  )
                : SpinKitCircle(color: AppColors.white, size: AppSizes.iconMd),
          ),
        ),
      ),
    );
  }
}