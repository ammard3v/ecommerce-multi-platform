import 'package:eshop/utils/constants/colors.dart';
import '../../../../utils/constants/texts.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../common/widgets/chip/sort_chip_list.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../filter/widget/price_range_slider.dart';
import 'rating_chip.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../category/presentation/bloc/category_bloc.dart';
class FilterBtn extends StatefulWidget {
  const FilterBtn({super.key});
  @override
  State<FilterBtn> createState() => _FilterBtnState();
}
class _FilterBtnState extends State<FilterBtn> {
  late RangeValues selectedPriceRange;
  late Set<String> selectedRatings = {};
  Set<String> selectedCategory = {};
  @override
  void initState() {
    super.initState();
    selectedPriceRange = RangeValues(100, 500);
    final catState = context.read<CategoryBloc>().state;
    if (catState is CategoryLoadedAll) {
      selectedCategory.addAll(catState.categories.map((e) => e.title));
      selectedCategory.add("All");
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await showModalBottomSheet<FilterData>(
          context: context,
          isScrollControlled: true,
          builder: (_) => FilterBottomSheet(
            selectedPriceRange: selectedPriceRange,
            selectedRatings: selectedRatings,
            selectedCategory: selectedCategory,
          ),
        );
        if (result != null) {
          setState(() {
            selectedPriceRange = result.priceRange;
            selectedRatings = result.ratings;
            selectedCategory = result.categories;
          });
        }
      },
      child: const RoundedContainer(
        height: 50,
        width: 50,
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.filter_alt_rounded,
          color: AppColors.white,
        ),
      ),
    );
  }
}
class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet(
      {super.key,
      required this.selectedPriceRange,
      required this.selectedRatings,
      required this.selectedCategory});
  final RangeValues selectedPriceRange;
  final Set<String> selectedRatings;
  final Set<String> selectedCategory;
  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}
class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late RangeValues selectedPriceRange;
  late Set<String> selectedRatings;
  late Set<String> selectedCategory;
  @override
  void initState() {
    super.initState();
    selectedPriceRange = widget.selectedPriceRange;
    selectedCategory = widget.selectedCategory;
    selectedRatings = widget.selectedRatings;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppTexts.category),
          const SizedBox(height: AppSizes.xs),
          RatingChipList(
            chips: selectedCategory.toList(),
            newValues: (Set<String> p1) {
              setState(() {
                selectedRatings = p1;
              });
            },
            showIcon: false,
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          Text(AppTexts.priceRange),
          const SizedBox(height: AppSizes.xs),
          PriceRangeSlider(
            onChanged: (selected) {
              setState(() {
                selectedPriceRange = selected;
              });
            },
            initialRange: selectedPriceRange,
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          Text(AppTexts.sortby),
          const SizedBox(height: AppSizes.xs),
          SortChipList(),
          SizedBox(height: AppSizes.spaceBtwItems),
          Text(AppTexts.ratings),
          const SizedBox(height: AppSizes.xs),
          RatingChipList(
            chips: ["All", "5", "4", "3", "2", "1"],
            newValues: (Set<String> p1) {
              setState(() {
                selectedRatings = p1;
              });
            },
            showIcon: true,
          ),
          const SizedBox(height: AppSizes.sm),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory.clear();
                      selectedCategory.add("All");
                      selectedRatings.clear();
                    });
                  },
                  child: const Text('Reset Filter'),
                ),
              ),
              const SizedBox(width: AppSizes.md),
              Expanded(
                child: DElevatedButton(
                  onPressed: () {
                    final data = FilterData(
                        categories: selectedCategory,
                        priceRange: selectedPriceRange,
                        ratings: selectedRatings);
                    debugPrint(selectedCategory.toString());
                    debugPrint(selectedPriceRange.toString());
                    debugPrint(selectedRatings.toString());
                    debugPrint(data.toString());
                    Navigator.pop(context, data);
                  },
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
class FilterData {
  final RangeValues priceRange;
  final Set<String> ratings;
  final Set<String> categories;
  FilterData({
    required this.priceRange,
    required this.ratings,
    required this.categories,
  });
  @override
  String toString() {
    return 'FilterData(priceRange: $priceRange, ratings:$ratings, categories: $categories)';
  }
}