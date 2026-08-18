import '../../../../common/screens/common_searchbar_cubit.dart';
import '../../../products/domain/entity/single_product_entity.dart';
import '../../../shop/home/home.dart';
class NoProductFound extends StatelessWidget {
  const NoProductFound({
    super.key,
    required this.products,
  });
  final List<SingleProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<CommonSearchbarCubit, String>(
            builder: (context, state) {
              return Text(AppTexts.resultsFor + state);
            },
          ),
          Text("${products.length}${AppTexts.resultsFound}"),
        ],
      )
    ]);
  }
}