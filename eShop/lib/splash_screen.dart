import 'package:eshop/features/shop/home/home.dart';
import 'package:eshop/common/widgets/spinner/spinner.dart';
import 'package:eshop/features/auth/presentation/bloc/auth_bloc.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<AuthBloc>().add(CheckLoggedIn());
      context.read<CategoryBloc>().add(FetchAllCategory());
      context.read<AddressBloc>().add(FetchAddressEvent());
      context
          .read<FeaturedProductCubit>()
          .fetchFeaturedProducts(FetchProductsReq());
      context
          .read<BudgetProductCubit>()
          .fetchBudgetProducts(FetchProductsReq());
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Spinner());
  }
}
class NotFound extends StatelessWidget {
  const NotFound({super.key});
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
        backgroundColor: AppColors.primary, child: Text(AppTexts.pageDntExist));
  }
}