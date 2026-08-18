import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../features/navigation/cubit/navigation_bar_cubit.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/device_helpers.dart';
import '../../../utils/device/device_utility.dart';
class DAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DAppBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.resetStackRoute,
  });
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final String? resetStackRoute;
  @override
  Widget build(BuildContext context) {
    bool dark = DeviceHelpers.isDarkMode(context);
    final router = GoRouter.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: leadingOnPressed ??
            () {
              context.read<NavigationBarCubit>().selectedNavigation(0);
              if (resetStackRoute != null) {
                router.go(resetStackRoute!);
                return;
              }
              if (router.canPop()) {
                router.pop();
              } else {
                router.go('/navigationMenu');
              }
            },
        icon: Icon(
          leadingIcon ?? Iconsax.arrow_left,
          color: dark ? AppColors.white : AppColors.black,
        ),
      ),
      title: title,
      actions: actions,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(DeviceUtility.appBarHeight);
}