import 'package:eshop/utils/helpers/global_user.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../core/routes/route_barel.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/device_helpers.dart';
import '../../utils/constants/sizes.dart';
import 'cubit/navigation_bar_cubit.dart';
import 'destinations.dart';
class NavigationMenuScreen extends StatelessWidget {
  const NavigationMenuScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
          body: IndexedStack(
              index: context.watch<NavigationBarCubit>().state.selectedIndex,
              children: GlobalUser.isAdmin(context)
                  ? NavigationDestinations.adminPages
                  : NavigationDestinations.userPages),
          bottomNavigationBar: RoundedContainer(
            showBoxShadow: true,
            radius: 30,
            backgroundColor: AppColors.transparent,
            borderColor: AppColors.primary.withValues(alpha: .5),
            showBorder: true,
            height: 80,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                backgroundColor: Colors.transparent,
                rippleColor: dark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.1),
                hoverColor: dark
                    ? Colors.white.withValues(alpha: 0.05)
                    : Colors.black.withValues(alpha: 0.05),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                gap: 8,
                duration: const Duration(milliseconds: 400),
                color: dark ? Colors.grey[400] : Colors.grey[700],
                activeColor: AppColors.primary,
                iconSize: AppSizes.iconMd,
                tabBackgroundColor: dark
                    ? Colors.white.withValues(alpha: 0.08)
                    : AppColors.primary.withValues(alpha: 0.12),
                selectedIndex:
                    context.watch<NavigationBarCubit>().state.selectedIndex,
                onTabChange: (value) => context
                    .read<NavigationBarCubit>()
                    .selectedNavigation(value),
                tabs: GlobalUser.isAdmin(context)
                    ? NavigationDestinations.adminNavDestinations
                    : NavigationDestinations.userNavDestinations,
              ),
            ),
          )),
    );
  }
}