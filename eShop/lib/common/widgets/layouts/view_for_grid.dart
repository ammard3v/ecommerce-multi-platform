import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/routes/route_barel.dart';
import '../../../features/shop/home/home.dart';
import '../../../features/wishlist/presentation/cubit/wishlist_cubit.dart';
import '../icons/circular_icon.dart';
class ViewForGrid extends StatelessWidget {
  const ViewForGrid({
    super.key,
    required this.products,
  });
  final List<SingleProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: products.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 12,
          maxCrossAxisExtent: 180,
          mainAxisExtent: 260,
        ),
        itemBuilder: (context, index) {
          final item = products[index];
          return RoundedContainer(
            radius: 0,
            backgroundColor: Colors.transparent,
            child: GestureDetector(
              onTap: () => context.pushNamed(RouteNames.singleProduct,
                  extra: products[index]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    RoundedContainer(
                      showBorder: true,
                      height: 180,
                      radius: 20,
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
                    BlocBuilder<WishlistCubit, WishlistState>(
                      builder: (context, state) {
                        return Positioned(
                            right: 10,
                            top: 10,
                            child: CircularIcon(
                                height: 40,
                                width: 40,
                                color: Colors.red.shade400,
                                backgroundColor: AppColors.lightGrey,
                                onPressed: () {
                                  context
                                      .read<WishlistCubit>()
                                      .addToWishlist(item.id);
                                },
                                icon: context
                                        .watch<WishlistCubit>()
                                        .wishlistContains(products[index].id)
                                    ? Icons.favorite_outline
                                    : Icons.favorite_rounded));
                      },
                    )
                  ]),
                  SizedBox(height: AppSizes.sm),
                  Expanded(
                    child: RoundedContainer(
                        radius: 0,
                        backgroundColor: Colors.transparent,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title,
                                maxLines: 1, overflow: TextOverflow.ellipsis),
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
                        )),
                  )
                ],
              ),
            ),
          );
        });
  }
}