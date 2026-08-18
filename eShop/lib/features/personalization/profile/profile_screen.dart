import 'package:eshop/common/widgets/snackbar/toast.dart';
import 'package:go_router/go_router.dart';
import '../../../common/cubits/app_user/app_user_cubit.dart';
import '../../../common/cubits/theme/theme_cubit.dart';
import '../../../common/widgets/modalbottomsheet/custom_bottom_sheet.dart';
import 'package:eshop/core/routes/route_names.dart';
import 'package:eshop/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:eshop/features/personalization/profile/widgets/menu_list.dart';
import 'package:eshop/features/shop/home/home.dart';
import 'package:eshop/utils/helpers/global_user.dart';
import 'package:iconsax/iconsax.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final userData = GlobalUser.userData(context);
    final dark = DeviceHelpers.isDarkMode(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 280,
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppColors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: AppSizes.spaceBtwItems * 2),
                    RoundedContainer(
                      height: 80,
                      width: 80,
                      radius: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(100),
                        child: CacheImage(
                            height: double.infinity,
                            width: double.infinity,
                            userData?.photo ?? ""),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<AppUserCubit, AppUserState>(
                          builder: (context, state) {
                            if (state is AppUserLoaded) {
                              return Text(
                                state.user.name,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              );
                            }
                            return Text(
                              "No name",
                              style: TextStyle(color: AppColors.white),
                            );
                          },
                        ),
                        SizedBox(width: AppSizes.xs),
                        if (userData?.isVerified ?? false)
                          Icon(Icons.verified,
                              size: AppSizes.iconMd, color: AppColors.white)
                      ],
                    ),
                    if (userData != null)
                      Text(
                        userData.email,
                        style: TextStyle(color: Colors.white70),
                      ),
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: dark ? AppColors.black : AppColors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSectionHeadings(
                    title: "Account",
                    onPressed: null,
                    buttonTitle: "",
                  ),
                  SizedBox(height: AppSizes.md),
                  RoundedContainer(
                    showBorder: true,
                    backgroundColor: dark ? AppColors.black : AppColors.white,
                    showBoxShadow: true,
                    child: SettingsOptions(listData: accountMenu),
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),
                  AppSectionHeadings(
                    title: "Preferences",
                    onPressed: null,
                    buttonTitle: "",
                  ),
                  SizedBox(height: AppSizes.md),
                  RoundedContainer(
                    showBorder: true,
                    backgroundColor: dark ? AppColors.black : AppColors.white,
                    showBoxShadow: true,
                    child: SettingsOptions(listData: prefMenu),
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key, required this.listData});
  final List listData;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: listData[index]["icon"],
          title: Text(listData[index]["title"]!),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: AppColors.primary,
          ),
          onTap: () {
            if (listData == accountMenu) {
              switch (index) {
                case 0:
                  context.pushNamed(RouteNames.editProfile);
                  break;
                case 1:
                  context.pushNamed(RouteNames.order);
                  break;
                case 4:
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (context) => SafeArea(
                      child: CustomBottomSheet(
                        title: "Are you sure you want to log out?",
                        confirmText: "Yes, log out",
                        onConfirm: () {
                          if (GlobalUser.isAuthenticated(context)) {
                            context.read<AuthBloc>().add(Logout());
                          }
                        },
                        cancelText: "Cancel",
                        onCancel: () => Navigator.pop(context),
                      ),
                    ),
                  );
                case 5:
                  context.pushNamed(RouteNames.myReview);
                default:
                  return;
              }
            }
            if (listData == prefMenu) {
              switch (index) {
                case 0:
                  context.pushNamed(RouteNames.address);
                  break;
                case 1:
                  ToastHelper.show(context, message: "Coming soon");
                  break;
                case 2:
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => SafeArea(
                            child: RoundedContainer(
                              height: 100,
                              padding: const EdgeInsets.all(16),
                              backgroundColor: AppColors.transparent,
                              child: Column(
                                children: [
                                  Center(
                                    child: BlocBuilder<ThemeCubit, ThemeState>(
                                      builder: (context, currentTheme) {
                                        return SegmentedButton<ThemeState>(
                                          style: ButtonStyle(
                                            backgroundColor: WidgetStateProperty
                                                .resolveWith<Color?>(
                                              (states) {
                                                if (states.contains(
                                                    WidgetState.selected)) {
                                                  return AppColors.primary;
                                                }
                                                return Colors.transparent;
                                              },
                                            ),
                                            foregroundColor: WidgetStateProperty
                                                .resolveWith<Color?>(
                                              (states) {
                                                if (states.contains(
                                                    WidgetState.selected)) {
                                                  return AppColors.white;
                                                }
                                                return Colors.grey;
                                              },
                                            ),
                                          ),
                                          segments: const [
                                            ButtonSegment(
                                              value: ThemeState.light,
                                              label: Text("Light"),
                                              icon: Icon(Icons.light_mode),
                                            ),
                                            ButtonSegment(
                                              value: ThemeState.dark,
                                              label: Text("Dark"),
                                              icon: Icon(Icons.dark_mode),
                                            ),
                                            ButtonSegment(
                                              value: ThemeState.system,
                                              label: Text("System"),
                                              icon: Icon(Icons.settings),
                                            ),
                                          ],
                                          selected: {currentTheme},
                                          onSelectionChanged: (newSelection) {
                                            context
                                                .read<ThemeCubit>()
                                                .setThemeMode(
                                                    newSelection.first);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 100),
                                ],
                              ),
                            ),
                          ));
                case 3:
                  ToastHelper.show(context, message: "Coming soon");
                  break;
                default:
                  return;
              }
            }
          },
        );
      },
    );
  }
}