import '../../../utils/constants/colors.dart';
import '../../../core/routes/route_barel.dart';
import '../../../features/search/data/model/product_sort_req.dart';
import '../../../features/search/presentation/cubit/search_product_cubit.dart';
import '../../../utils/constants/sizes.dart';
class SortChipList extends StatefulWidget {
  const SortChipList({
    super.key,
  });
  @override
  State<SortChipList> createState() => _SortChipListState();
}
class _SortChipListState extends State<SortChipList> {
  String selectedTitle = "Newest First";
  final List<Map<String, dynamic>> sortDataList = [
    {
      "title": "Newest First",
      'sort': '-createdAt',
    },
    {
      "title": "Top Rated",
      'sort': '-ratings.average',
    },
    {
      "title": "Price: High to Low",
      'sort': '-price',
    },
    {
      "title": "Price: Low to High",
      'sort': 'price',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sortDataList.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSizes.xs),
        itemBuilder: (context, index) {
          final chip = sortDataList[index];
          final isSelected = chip["title"] == selectedTitle;
          return FilterChip(
            selectedColor: AppColors.primary,
            label: Text(chip["title"]),
            showCheckmark: false,
            selected: isSelected,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg * 2),
            ),
            onSelected: (value) {
              if (value) {
                setState(() {
                  selectedTitle = chip["title"];
                });
                String searchWord = context.read<CommonSearchbarCubit>().state;
                context.read<SearchProductCubit>().fetchSearchProduct(
                    ProductSortReq(q: searchWord, sort: chip["sort"]));
              }
            },
          );
        },
      ),
    );
  }
}