import 'package:eshop/features/review/presentation/pages/my_reviews.dart';
import 'route_barel.dart';
List<RouteBase> routes = [
  GoRoute(
    name: RouteNames.splash,
    path: "/splash",
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    name: RouteNames.signIn,
    path: "/signIn",
    builder: (context, state) => SignInScreen(),
  ),
  GoRoute(
    name: RouteNames.signUp,
    path: "/signUp",
    builder: (context, state) => SignUpScreen(),
  ),
  GoRoute(
    name: RouteNames.forgotPassword,
    path: "/forgotPassword",
    builder: (context, state) => ForgotPasswordScreen(),
  ),
  GoRoute(
    name: RouteNames.resetPassword,
    path: "/resetPassword",
    builder: (context, state) {
      final email = state.extra as String;
      return ResetPasswordScreen(email: email);
    },
  ),
  GoRoute(
    name: RouteNames.verifyEmail,
    path: "/verifyEmail",
    builder: (context, state) {
      final email =
          state.extra as String? ?? state.uri.queryParameters['email'] ?? '';
      final otp = state.uri.queryParameters['otp'] ?? '';
      return VerifyEmailScreen(
        email: email,
        prefilledOtp: otp,
      );
    },
  ),
  GoRoute(
    name: RouteNames.home,
    path: "/home",
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    name: RouteNames.navigationMenu,
    path: "/navigationMenu",
    builder: (context, state) => NavigationMenuScreen(),
  ),
  GoRoute(
    name: RouteNames.products,
    path: "/products",
    builder: (context, state) => ProductsScreen(),
  ),
  GoRoute(
    name: RouteNames.singleProduct,
    path: "/singleProduct",
    builder: (context, state) {
      final extra = state.extra;
      if (extra != null && extra is SingleProductEntity) {
        return SingleProductScreen(singleProductEntity: extra);
      } else {
        final id = state.extra as String;
        return SingleProductScreen(singleProductEntity: null, id: id);
      }
    },
  ),
  GoRoute(
    name: RouteNames.productByCategory,
    path: "/productByCategory",
    builder: (context, state) {
      final categoryMap = state.uri.queryParameters as Map<String, dynamic>;
      return ProductsByCategory(categoryMap: categoryMap);
    },
  ),
  GoRoute(
    name: RouteNames.category,
    path: "/category",
    builder: (context, state) => CategoryScreen(),
  ),
  GoRoute(
    name: RouteNames.search,
    path: "/search",
    builder: (context, state) => BlocProvider(
      create: (_) => CommonSearchbarCubit(),
      child: SearchScreen(),
    ),
  ),
  GoRoute(
    name: RouteNames.cart,
    path: "/cart",
    builder: (context, state) => CartScreen(),
  ),
  GoRoute(
    name: RouteNames.checkout,
    path: "/checkout",
    builder: (context, state) => CheckoutScreen(),
  ),
  GoRoute(
    name: RouteNames.address,
    path: "/address",
    builder: (context, state) => AddressScreen(),
  ),
  GoRoute(
    name: RouteNames.addNewAddress,
    path: "/addNewAddress",
    builder: (context, state) => AddNewAddressScreen(),
  ),
  GoRoute(
    name: RouteNames.paymentProcessing,
    path: "/paymentProcessing",
    builder: (context, state) {
      final id = state.extra as String;
      return PaymentProcessing(id: id);
    },
  ),
  GoRoute(
    name: RouteNames.paymentSuccess,
    path: "/paymentSuccess",
    builder: (context, state) {
      final order = state.extra as OrderEntity;
      return PaymentSucees(orderEntity: order);
    },
  ),
  GoRoute(
    name: RouteNames.order,
    path: "/order",
    builder: (context, state) => OrderScreen(),
  ),
  GoRoute(
    name: RouteNames.trackOrder,
    path: "/trackOrder",
    builder: (context, state) {
      final orderId = state.extra as String;
      return BlocProvider(
        create: (_) {
          final bloc = sl<OrderBloc>();
          bloc.add(FetchOrderStatusEvent(orderId));
          return bloc;
        },
        child: TrackOrderScreen(orderId: orderId),
      );
    },
  ),
  GoRoute(
    name: RouteNames.review,
    path: "/review",
    builder: (context, state) {
      final orderId = state.extra as String;
      return ReviewScreen(productId: orderId);
    },
  ),
  GoRoute(
    name: RouteNames.myReview,
    path: "/myreview",
    builder: (context, state) {
      return MyReviews();
    },
  ),
  GoRoute(
    name: RouteNames.editProfile,
    path: "/editProfile",
    builder: (context, state) => EditProfileScreen(),
  ),
  GoRoute(
    name: RouteNames.wishlist,
    path: "/wishlist",
    builder: (context, state) => WishlistScreen(),
  ),
  GoRoute(
    name: RouteNames.chat,
    path: "/chat",
    builder: (context, state) => ChatScreen(),
  ),
  GoRoute(
    name: RouteNames.notification,
    path: "/notification",
    builder: (context, state) => NotificationScreen(),
  ),
];