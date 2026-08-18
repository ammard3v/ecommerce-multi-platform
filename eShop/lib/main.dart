import 'package:eshop/features/admin/admin_users_manage/presentation/admin_users_manage_screen.dart';
import 'package:eshop/features/admin/admin_users_manage/presentation/cubit/admin_user_cubit.dart';
import 'package:eshop/features/shop/home/home.dart';
import 'package:eshop/runBefore.dart';
import 'common/cubits/theme/theme_cubit.dart';
import 'common/cubits/app_user/app_user_cubit.dart';
import 'common/cubits/internet_connection/internet_connection_cubit.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/navigation/cubit/navigation_bar_cubit.dart';
import 'features/notification/presentation/cubit/notification_cubit.dart';
import 'features/order/presentation/bloc/order_bloc.dart';
import 'features/products/presentation/bloc/product_bloc.dart';
import 'features/review/presentation/bloc/review_bloc.dart';
import 'features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'features/search/presentation/cubit/search_product_cubit.dart';
import 'app/app.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await runbefore();
  runApp(
    const AppBlocProviders(child: AppRoot()),
  );
}
class AppBlocProviders extends StatelessWidget {
  final Widget child;
  const AppBlocProviders({required this.child, super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<PaymentCubit>()),
        BlocProvider(create: (_) => sl<InternetConnectionCubit>()),
        BlocProvider(create: (_) => sl<ThemeCubit>()),
        BlocProvider(create: (_) => sl<NavigationBarCubit>()),
        BlocProvider(create: (_) => sl<AppUserCubit>()..loadUser()),
        BlocProvider(create: (_) => sl<AuthBloc>()),
        BlocProvider(create: (_) => sl<CategoryBloc>()),
        BlocProvider(create: (_) => sl<ProductBloc>()),
        BlocProvider(create: (_) => sl<SearchProductCubit>()),
        BlocProvider(create: (_) => sl<CartBloc>()),
        BlocProvider(create: (_) => sl<AddressBloc>()),
        BlocProvider(create: (_) => sl<OrderBloc>()),
        BlocProvider(create: (_) => sl<ReviewBloc>()),
        BlocProvider(create: (_) => sl<NotificationCubit>()),
        BlocProvider(create: (_) => sl<WishlistCubit>()),
        BlocProvider(create: (_) => sl<FeaturedProductCubit>()),
        BlocProvider(create: (_) => sl<BudgetProductCubit>()),
        BlocProvider(
          create: (_) => sl<AdminUserCubit>(),
          child: AdminUsersManageScreen(),
        )
      ],
      child: child,
    );
  }
}