import 'package:eshop/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../common/widgets/products/product_card_vertical.dart';
import '../../../products/domain/entity/single_product_entity.dart';
import '../../../../utils/constants/sizes.dart';
class ProductsHorizontalCubitSection<C extends Cubit<S>, S>
    extends StatelessWidget {
  final C Function() createCubit;
  final void Function(C cubit) onInit;
  final bool Function(S state) isLoading;
  final List<SingleProductEntity>? Function(S state) products;
  final String? Function(S state) error;
  const ProductsHorizontalCubitSection({
    super.key,
    required this.createCubit,
    required this.onInit,
    required this.isLoading,
    required this.products,
    required this.error,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: (_) {
        final cubit = createCubit();
        onInit(cubit);
        return cubit;
      },
      child: BlocBuilder<C, S>(
        builder: (context, state) {
          if (isLoading(state)) {
            return const SizedBox(
                height: 275,
                child: Center(
                    child:
                        CircularProgressIndicator(color: AppColors.primary)));
          }
          final list = products(state);
          if (list != null) {
            return _ProductsHorizontalList(list);
          }
          final message = error(state);
          if (message != null) {
            return Text(message);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
class _ProductsHorizontalList extends StatelessWidget {
  final List<SingleProductEntity> products;
  const _ProductsHorizontalList(this.products);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: AppSizes.gridViewSpacing),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 180,
            child: GestureDetector(
              onTap: () => context.pushNamed(RouteNames.singleProduct,
                  extra: products[index].id),
              child: DProductCardCommon(
                index: index,
                singleProductEntity: products[index],
              ),
            ),
          );
        },
      ),
    );
  }
}