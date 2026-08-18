import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../common/widgets/products/product_card_vertical.dart';
import 'domain/usecase/usecase.dart';
import 'presentation/bloc/product_bloc.dart';
import '../../common/widgets/appbar/custom_appbar.dart';
import '../../utils/constants/sizes.dart';
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}
class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProductBloc>()
        .add(FetchAllProductEvent(fetchProductsReq: FetchProductsReq()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(title: Text('Products Screen'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.defaultSpace,
          ),
          child: Column(
            children: [
              RoundedContainer(
                height: 40,
                backgroundColor: Colors.red,
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              BlocConsumer<ProductBloc, ProductState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ProductLoadedState) {
                    final products = state.productEntity.products;
                    final metas = state.productEntity.meta;
                    return Column(
                      children: [
                        GridLayout(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return DProductCardCommon(
                              index: index,
                              singleProductEntity: products[index],
                            );
                          },
                        ),
                        SizedBox(height: AppSizes.spaceBtwItems * 1.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                child: Text(metas.page.toString())),
                            SizedBox(width: AppSizes.spaceBtwItems / 4),
                            ElevatedButton(onPressed: () {}, child: Text("__")),
                            SizedBox(width: AppSizes.spaceBtwItems / 4),
                            ElevatedButton(
                                onPressed: () {},
                                child: Text(metas.totalPages.toString())),
                            SizedBox(width: AppSizes.spaceBtwItems / 4),
                          ],
                        ),
                        SizedBox(height: AppSizes.spaceBtwItems * 1.5),
                      ],
                    );
                  }
                  return Text('OOps');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisCount = 275,
    required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSizes.gridViewSpacing,
        crossAxisSpacing: AppSizes.gridViewSpacing,
        mainAxisExtent: mainAxisCount,
      ),
      itemBuilder: itemBuilder,
    );
  }
}