import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
class AppbarHeader extends StatelessWidget {
  const AppbarHeader(
      {super.key,
      this.title = "Title",
      this.show = false,
      this.showBack = true});
  final String title;
  final bool show;
  final bool showBack;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        showBack
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: RoundedContainer(
                    height: AppSizes.appBarHeight,
                    width: AppSizes.appBarHeight,
                    radius: 100,
                    showBorder: true,
                    borderColor: AppColors.grey,
                    backgroundColor: AppColors.white,
                    child: Icon(Iconsax.arrow_left, color: AppColors.black),
                  ),
                ),
              )
            : SizedBox(),
        Text(title, style: TextStyle(fontSize: 18)),
        show
            ? RoundedContainer(
                height: AppSizes.appBarHeight,
                width: AppSizes.appBarHeight,
                backgroundColor: AppColors.buttonPrimary,
              )
            : SizedBox()
      ],
    );
  }
}