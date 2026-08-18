import 'package:eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:eshop/common/screens/common_searchbar_cubit.dart';
import 'package:eshop/features/search/data/model/product_sort_req.dart';
import 'package:eshop/features/search/presentation/cubit/search_product_cubit.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/device_helpers.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/texts.dart';
class CommonSearchbar extends StatefulWidget {
  const CommonSearchbar({
    super.key,
    this.searchLabel = AppTexts.searchInStore,
    this.allowSearch = true,
  });
  final String searchLabel;
  final bool allowSearch;
  @override
  State<CommonSearchbar> createState() => _CommonSearchbarState();
}
class _CommonSearchbarState extends State<CommonSearchbar> {
  final TextEditingController searchText = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    searchText.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return RoundedContainer(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.sm),
      height: AppSizes.searchBarHeight,
      width: double.infinity,
      backgroundColor: dark ? AppColors.darkerGrey : AppColors.lightBackground,
      radius: AppSizes.borderRadiusLg,
      showBoxShadow: true,
      showBorder: true,
      child: Row(
        children: [
          Icon(
            Iconsax.search_normal,
            color: AppColors.primary,
            size: AppSizes.iconMd,
          ),
          SizedBox(width: AppSizes.spaceBtwItems),
          Expanded(
            child: TextField(
              controller: widget.allowSearch ? searchText : null,
              enabled: widget.allowSearch,
              showCursor: widget.allowSearch,
              onSubmitted: widget.allowSearch
                  ? (value) {
                      context.read<CommonSearchbarCubit>().updateQuery(value);
                      final text = value.trim();
                      if (text.isNotEmpty) {
                        context
                            .read<SearchProductCubit>()
                            .saveStoredTexts(text);
                        context
                            .read<SearchProductCubit>()
                            .fetchSearchProduct(ProductSortReq(q: text));
                      }
                    }
                  : null,
              decoration: InputDecoration(
                hintText: widget.searchLabel,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          if (widget.allowSearch)
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.read<SearchProductCubit>().clearSearchBar();
                searchText.clear();
              },
              icon: Icon(
                Iconsax.close_circle,
                color: AppColors.primary,
                size: AppSizes.iconMd,
              ),
            ),
        ],
      ),
    );
  }
}