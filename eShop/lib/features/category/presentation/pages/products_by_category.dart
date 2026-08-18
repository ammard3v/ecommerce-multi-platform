import 'package:eshop/core/routes/route_barel.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/layouts/view_for_grid.dart';
import '../../../../common/widgets/spinner/center_spinner.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../products/presentation/bloc/product_bloc.dart';
class ProductsByCategory extends StatefulWidget {
  const ProductsByCategory({super.key, required this.categoryMap});
  final Map<String, dynamic> categoryMap;
  @override
  State<ProductsByCategory> createState() => _ProductsByCategoryState();
}
class _ProductsByCategoryState extends State<ProductsByCategory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductBloc>().add(
            FetchProductByCategoryEvent(id: widget.categoryMap["id"]),
          );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        leadingOnPressed: () => Navigator.pop(context),
        title: Text(widget.categoryMap["title"]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsetsGeometry.symmetric(horizontal: AppSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                  if (state is ProductLoadedState) {
                    final products = state.productEntity.products;
                    if (products.isNotEmpty) {
                      return ViewForGrid(products: products);
                    } else {
                      return const Text("No Products for now");
                    }
                  }
                  if (state is ProductInitialState ||
                      state is ProductLoadingState) {
                    return CenterSpinner();
                  }
                  return CenterText(text: "No Products for now");
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}