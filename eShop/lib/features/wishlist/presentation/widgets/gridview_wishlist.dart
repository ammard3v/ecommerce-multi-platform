import 'package:go_router/go_router.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/modalbottomsheet/custom_bottom_sheet.dart';
import '../../../shop/home/home.dart';
import '../cubit/wishlist_cubit.dart';
import 'product_card_body.dart';
class GridViewWishList extends StatelessWidget {
  const GridViewWishList({
    super.key,
    required this.state,
  });
  final WishlistLoaded state;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: state.wishlist.length,
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
          final item = state.wishlist[index];
          return GestureDetector(
            onTap: () => context.pushNamed(
              RouteNames.singleProduct,
              extra: item.id,
            ),
            child: RoundedContainer(
              radius: 0,
              backgroundColor: Colors.transparent,
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
                          state.wishlist[index].index0Image,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: CircularIcon(
                          height: 30,
                          width: 30,
                          color: Colors.red.shade400,
                          backgroundColor: AppColors.lightGrey,
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (context) => SafeArea(
                                child: CustomBottomSheet(
                                  title: "Remove from Wishlist?",
                                  confirmText: "Yes, Remove",
                                  onConfirm: () {
                                    context
                                        .read<WishlistCubit>()
                                        .addToWishlist(item.id);
                                    Navigator.pop(context);
                                  },
                                  cancelText: "Cancel",
                                  onCancel: () => Navigator.pop(context),
                                ),
                              ),
                            );
                          },
                          icon: Icons.favorite_rounded,
                        ))
                  ]),
                  SizedBox(height: AppSizes.sm),
                  Expanded(
                    child: RoundedContainer(
                      radius: 0,
                      backgroundColor: Colors.transparent,
                      height: double.infinity,
                      child: CommonProductCardBody(
                        wishlistEntity: state.wishlist[index],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}