import 'package:eshop/features/search/presentation/bottom_pagination.dart';
import '../../../common/widgets/spinner/center_spinner.dart';
import '../../../common/widgets/layouts/view_for_grid.dart';
import 'widgets/no_product_found.dart';
import '../../shop/home/home.dart';
import '../../../common/widgets/chip/sort_chip_list.dart';
import '../../../core/routes/route_barel.dart';
import 'widgets/filter_btn.dart';
import 'cubit/search_product_cubit.dart';
import 'widgets/initial_search_history.dart';
import 'widgets/search_top_header.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        context.read<SearchProductCubit>().clearSearchBar();
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: AppSizes.sm),
                    Expanded(child: SearchTopHeader()),
                  ],
                ),
                SizedBox(height: AppSizes.spaceBtwItems),
                Padding(
                  padding: EdgeInsets.zero,
                  child: BlocBuilder<SearchProductCubit, SearchProductState>(
                    builder: (context, state) {
                      if (state is SearchProductInitial ||
                          state is SearchCacheLoaded) {
                        return InitialSearchHistory();
                      }
                      if (state is SearchProductFailure ||
                          state is SearchCacheFailure) {
                        return Text('Failure');
                      }
                      if (state is SearchProductLoading) {
                        return CenterSpinner();
                      }
                      if (state is SearchProductLoaded) {
                        final products = state.productEntity.products;
                        if (products.isNotEmpty) {
                          return Column(
                            children: [
                              SortChipList(),
                              ShowView(products: products),
                            ],
                          );
                        }
                        return NoProductFound(products: products);
                      }
                      if (state is SortProductLoaded) {
                        final products = state.productEntity.products;
                        if (products.isNotEmpty) {
                          return Column(
                            children: [
                              SortChipList(),
                              ShowView(products: products),
                            ],
                          );
                        }
                        return NoProductFound(products: products);
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
                SizedBox(height: AppSizes.spaceBtwItems),
                SizedBox(height: AppSizes.spaceBtwItems),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
          BlocSelector<SearchProductCubit, SearchProductState, bool>(
        selector: (state) =>
            state is SearchProductLoaded &&
                state.productEntity.products.isNotEmpty ||
            state is SortProductLoaded &&
                state.productEntity.products.isNotEmpty,
        builder: (context, isLoaded) {
          if (isLoaded) {
            return RoundedContainer(
              height: 50,
              width: 50,
              radius: 50,
              backgroundColor: AppColors.primary,
              child: FilterBtn(),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
class ShowView extends StatelessWidget {
  const ShowView({
    super.key,
    required this.products,
  });
  final List<SingleProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<CommonSearchbarCubit, String>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppTexts.resultsFor + state),
                BlocBuilder<SearchProductCubit, SearchProductState>(
                  builder: (context, state) {
                    if (state is SearchProductLoaded) {
                      return Text(
                          "${state.productEntity.products.length} founds");
                    }
                    return SizedBox();
                  },
                ),
              ],
            );
          },
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        ViewForGrid(products: products)
      ],
    );
  }
}