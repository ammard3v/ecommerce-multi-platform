import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/fetch_products_req.dart';
import '../bloc/product_bloc.dart';
class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}
class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(
          FetchAllProductEvent(
            fetchProductsReq: FetchProductsReq(),
          ),
        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<ProductBloc>().add(
                    FetchAllProductEvent(
                      fetchProductsReq: FetchProductsReq(limit: 17),
                    ),
                  );
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadedState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.productEntity.products.length,
                    itemBuilder: (context, index) {
                      final product = state.productEntity.products[index];
                      return ListTile(
                        title: Text(product.title),
                        subtitle: Text('Rs.${product.price}'),
                      );
                    },
                  ),
                ),
                Text(
                  'Page: ${state.productEntity.meta.page} / ${state.productEntity.meta.totalPages}',
                ),
              ],
            );
          }
          return Text('oops');
        },
      ),
    );
  }
}