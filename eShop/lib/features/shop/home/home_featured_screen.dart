import 'package:iconsax/iconsax.dart';
import '../../../common/widgets/spinner/spinner.dart';
import '../../../common/widgets/images/cache_image.dart';
import 'featured_layout_help.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../common/widgets/icons/circular_icon.dart';
import '../../../common/widgets/images/rounded_image.dart';
import '../../../common/widgets/loader/loader.dart';
import '../../../core/routes/route_barel.dart';
import '../cubits/budget_product_cubit.dart';
import '../cubits/featured_product_cubit.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/device_helpers.dart';
import '../../../utils/constants/sizes.dart';
class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      child: BlocBuilder<FeaturedProductCubit, FeaturedProductState>(
        builder: (context, state) {
          if (state is FeaturedProductLoading) {
            return const Center(child: Spinner());
          }
          if (state is FeaturedProductLoaded) {
            return ListViewClean(product: state.productEntity.products);
          }
          if (state is FeaturedProductFailure) {
            return const Text('Something went wrong1');
          }
          return const SizedBox();
        },
      ),
    );
  }
}
class BudgetProductsSection extends StatelessWidget {
  const BudgetProductsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      child: BlocBuilder<BudgetProductCubit, BudgetProductState>(
        builder: (context, state) {
          if (state is BudgetProductLoading) {
            return const Center(child: Spinner());
          }
          if (state is BudgetProductLoaded) {
            return ListViewClean(product: state.productEntity.products);
          }
          if (state is BudgetProductFailure) {
            return const Text('Something went wrong2');
          }
          return const SizedBox();
        },
      ),
    );
  }
}