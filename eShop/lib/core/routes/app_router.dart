import 'dart:async';
import '../../app/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'route_base.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../splash_screen.dart';
class AppRouter {
  final AuthBloc authBloc;
  final Logger logger;
  AppRouter({
    required this.authBloc,
    required this.logger,
  });
  GoRouter get router => GoRouter(
        initialLocation: '/splash',
        refreshListenable: GoRouterRefreshStream(authBloc.stream),
        redirect: (context, state) {
          final authState = authBloc.state;
          logger.log(
              '[ROUTER] location=${state.matchedLocation}, authState=${authState.runtimeType}',
              category: "routes");
          final authRoutes = [
            '/signIn',
            '/signUp',
            '/forgotPassword',
            '/verifyEmail',
            '/resetPassword'
          ];
          if (authState is UnAuthenticated || authState is AuthFailure) {
            if (!authRoutes.contains(state.matchedLocation)) {
              debugPrint('[ROUTER] Redirecting to /signIn');
              return '/signIn';
            }
          }
          if (authState is AuthCacheFailure) {
            if (!authRoutes.contains(state.matchedLocation) &&
                state.matchedLocation != '/splash') {
              debugPrint('[ROUTER] Cache failure → redirect to /signIn');
              return '/signIn';
            }
          }
          if (authState is Authenticated) {
            if (state.matchedLocation == '/signIn' ||
                state.matchedLocation == '/splash') {
              if (kDebugMode) {
                debugPrint('[ROUTER] Redirecting to /navigationMenu');
              }
              return '/navigationMenu';
            }
          }
          if (kDebugMode) {
            debugPrint('[ROUTER] No redirect');
          }
          return null;
        },
        errorBuilder: (context, state) {
          if (kDebugMode) {
            debugPrint('[ROUTER] Error: ${state.error}');
          }
          return NotFound();
        },
        routes: routes,
      );
}
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream stream) {
    if (kDebugMode) {
      debugPrint('[ROUTER] GoRouterRefreshStream initialized');
    }
    _subscription = stream.asBroadcastStream().listen((event) {
      if (kDebugMode) {
        debugPrint('[ROUTER] Auth stream emitted: ${event.runtimeType}');
      }
      notifyListeners();
    });
    notifyListeners();
  }
  late final StreamSubscription _subscription;
  @override
  void dispose() {
    if (kDebugMode) {
      debugPrint('[ROUTER] GoRouterRefreshStream disposed');
    }
    _subscription.cancel();
    super.dispose();
  }
}