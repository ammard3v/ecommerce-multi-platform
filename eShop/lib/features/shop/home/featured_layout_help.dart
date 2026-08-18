import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app/disabled_overlay.dart';
import '../../../common/widgets/spinner/spinner.dart';
import '../../../core/routes/route_names.dart';
import '../../../common/widgets/icons/circular_icon.dart';
import '../../../common/widgets/images/rounded_image.dart';
import '../../../common/widgets/snackbar/toast.dart';
import '../../products/domain/entity/single_product_entity.dart';
import 'home.dart';
import '../../wishlist/presentation/cubit/wishlist_cubit.dart';
import '../../wishlist/presentation/widgets/product_card_body.dart';
import '../../../utils/device/device_utility.dart';
class ListViewClean extends StatelessWidget {
  const ListViewClean({
    super.key,
    required this.product,
  });
  final List<SingleProductEntity> product;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topLeft,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: product.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = product[index];
          return GestureDetector(
            onTap: () =>
                context.pushNamed(RouteNames.singleProduct, extra: item),
            child: RoundedContainer(
              radius: 0,
              width: 180,
              backgroundColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      RoundedContainer(
                        height: 180,
                        radius: 20,
                        showBorder: true,
                        backgroundColor: AppColors.buttonDisabled,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(20),
                          child: CacheImage(
                            item.index0Image,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      BlocSelector<WishlistCubit, WishlistState,
                          (bool isFav, bool isLoading)>(
                        selector: (state) {
                          if (state is WishlistLoaded) {
                            final id = product[index].id;
                            return (
                              state.wishlist.any((e) => e.id == id),
                              state.loadingProductIds.contains(id),
                            );
                          }
                          return (false, false);
                        },
                        builder: (context, data) {
                          final isFav = data.$1;
                          final isLoading = data.$2;
                          return Positioned(
                            right: 10,
                            top: 10,
                            child: InkWell(
                              onTap: isLoading
                                  ? null
                                  : () {
                                      context
                                          .read<WishlistCubit>()
                                          .addToWishlist(product[index].id);
                                    },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: isLoading
                                      ? const SizedBox(
                                          height: 18,
                                          width: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: AppColors.primary,
                                          ),
                                        )
                                      : Icon(
                                          isFav
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(height: AppSizes.sm),
                  ProductBottomView(item: item)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
class ProductBottomView extends StatelessWidget {
  const ProductBottomView({
    super.key,
    required this.item,
  });
  final SingleProductEntity item;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RoundedContainer(
        radius: 0,
        backgroundColor: Colors.transparent,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis),
            Row(
              children: [
                RatingBarIndicator(
                  rating: item.ratings.average,
                  itemCount: 1,
                  itemSize: 20,
                  itemBuilder: (context, _) => const Icon(
                    Iconsax.star1,
                    color: Colors.yellow,
                  ),
                ),
                Text(item.ratings.average.toString()),
                Text(" | ${item.unitsSold} sold")
              ],
            ),
            SizedBox(height: AppSizes.xs),
            Text("Rs ${item.price}"),
          ],
        ),
      ),
    );
  }
}