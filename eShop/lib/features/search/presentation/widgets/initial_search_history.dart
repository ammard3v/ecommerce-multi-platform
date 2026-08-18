import 'package:eshop/features/order/presentation/pages/barel.dart';
import 'package:eshop/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/screens/common_searchbar_cubit.dart';
import '../../data/model/product_sort_req.dart';
import '../cubit/search_product_cubit.dart';
import '../../../../utils/device/device_utility.dart';
class InitialSearchHistory extends StatefulWidget {
  const InitialSearchHistory({super.key});
  @override
  State<InitialSearchHistory> createState() => _InitialSearchHistoryState();
}
class _InitialSearchHistoryState extends State<InitialSearchHistory> {
  @override
  void initState() {
    super.initState();
    context.read<SearchProductCubit>().getStoredTexts();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        BlocBuilder<SearchProductCubit, SearchProductState>(
          builder: (context, state) {
            if (state is SearchCacheLoaded) {
              final data = state.storedData;
              if (data.isEmpty) {
                return SizedBox(
                    height: DeviceUtility.screenHeight(context) / 2 - 20,
                    child: Center(child: Text("Search for products here")));
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppTexts.recentSearch,
                          style: Theme.of(context).textTheme.bodySmall),
                      TextButton(
                        onPressed: () => context
                            .read<SearchProductCubit>()
                            .removeAllHistory(),
                        child: Text(
                          AppTexts.clearAll,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: AppColors.primary),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: EdgeInsets.only(left: AppSizes.md),
                      title: Text(data[index]!),
                      onTap: () {
                        context
                            .read<CommonSearchbarCubit>()
                            .updateQuery(data[index]!);
                        context.read<SearchProductCubit>().fetchSearchProduct(
                            ProductSortReq(q: data[index]!));
                      },
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            context
                                .read<SearchProductCubit>()
                                .removeSpecificText(data[index]!);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}