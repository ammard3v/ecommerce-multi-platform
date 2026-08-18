import 'package:iconsax/iconsax.dart';
import '../../../../common/screens/common_searchbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../core/routes/route_barel.dart';
import '../cubit/search_product_cubit.dart';
import '../../../../utils/constants/colors.dart';
class SearchTopHeader extends StatelessWidget {
  const SearchTopHeader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Expanded(child: CommonSearchbar())],
    );
  }
}