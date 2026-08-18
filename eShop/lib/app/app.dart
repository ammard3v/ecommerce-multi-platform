import 'dart:async';
import 'package:eshop/app/custom_scroll.dart';
import 'package:eshop/core/routes/route_barel.dart';
import 'package:eshop/core/routes/app_router.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/theme/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../common/cubits/internet_connection/internet_connection_cubit.dart';
import '../common/cubits/theme/theme_cubit.dart';
import '../common/no_connection.dart';
import 'server_down.dart';
class AppRoot extends StatefulWidget {
  const AppRoot({super.key});
  @override
  State<AppRoot> createState() => _AppRootState();
}
class _AppRootState extends State<AppRoot> {
  late final StreamSubscription<Uri?> _sub;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp.router(
          routerConfig: appRouter.router,
          scrollBehavior: CustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          themeMode: _getThemeMode(themeState),
          builder: (context, child) => ConnectionWrapper(
            child: AuthListenerWrapper(child: child!),
          ),
        );
      },
    );
  }
}
ThemeMode _getThemeMode(ThemeState themeState) {
  switch (themeState) {
    case ThemeState.light:
      return ThemeMode.light;
    case ThemeState.dark:
      return ThemeMode.dark;
    case ThemeState.system:
      return ThemeMode.system;
  }
}
class AuthListenerWrapper extends StatelessWidget {
  const AuthListenerWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return child;
  }
}
class ConnectionWrapper extends StatelessWidget {
  final Widget child;
  const ConnectionWrapper({required this.child, super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
      builder: (context, state) {
        if (state is ServerHealthDown) {
          return ServerDown();
        }
        if (state is InternetConnectionDisconnected) {
          return NoConnection();
        }
        if (state is InternetConnectionConnected) {
          return child;
        }
        return const Scaffold(
          body: Center(
            child: SpinKitFadingCube(
              size: 50,
              color: AppColors.primary,
            ),
          ),
        );
      },
    );
  }
}