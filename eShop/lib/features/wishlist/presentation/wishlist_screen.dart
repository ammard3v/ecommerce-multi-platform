import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/common/widgets/loader/loader.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:eshop/app/disabled_overlay.dart';
import 'package:eshop/common/widgets/appbar/custom_appbar.dart';
import 'package:eshop/common/widgets/icons/circular_icon.dart';
import 'package:eshop/common/widgets/layouts/view_for_grid.dart';
import 'package:eshop/common/widgets/snackbar/toast.dart';
import 'package:eshop/common/widgets/spinner/center_spinner.dart';
import 'package:eshop/common/widgets/spinner/spinner.dart';
import 'package:eshop/features/search/presentation/widgets/rating_chip.dart';
import 'package:eshop/features/shop/home/home.dart';
import 'package:eshop/features/wishlist/domain/entity/wishlist_entity.dart';
import 'package:eshop/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:eshop/features/wishlist/presentation/widgets/gridview_wishlist.dart';
import 'package:eshop/features/wishlist/presentation/widgets/product_card_body.dart';
class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}
class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WishlistCubit>().fetchWishlist();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        title: Text('Wishlist'),
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.white,
        onRefresh: () async => context.read<WishlistCubit>().fetchWishlist(),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<WishlistCubit, WishlistState>(
                  builder: (context, state) {
                    if (state is WishlistInitial || state is WishlistLoading) {
                      return SizedBox(height: 400, child: Spinner());
                    }
                    if (state is WishlistLoaded) {
                      if (state.wishlist.isEmpty) {
                        return CenterText(text: "No Items in Wishlist");
                      }
                      return GridViewWishList(
                        state: state,
                      );
                    }
                    if (state is WishlistFailure) {
                      return Text(AppTexts.sthWentNorth);
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}