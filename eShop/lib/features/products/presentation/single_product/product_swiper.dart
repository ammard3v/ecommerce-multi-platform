import 'package:iconsax/iconsax.dart';
import 'package:eshop/common/widgets/icons/circular_icon.dart';
import 'package:eshop/features/shop/home/home.dart';
import 'package:eshop/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:eshop/utils/device/device_utility.dart';
class ProductImageCarousel extends StatefulWidget {
  final List<String> images;
  final String id;
  const ProductImageCarousel({
    super.key,
    required this.images,
    required this.id,
  });
  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}
class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 2;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        RoundedContainer(
          height: height,
          width: width,
          radius: 30,
          backgroundColor: AppColors.buttonDisabled,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              return InteractiveViewer(child: CacheImage(widget.images[index]));
            },
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.images.length, (i) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentIndex == i ? 12 : 8,
                height: currentIndex == i ? 12 : 8,
                decoration: BoxDecoration(
                  color: currentIndex == i ? AppColors.white : Colors.white54,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
        RoundedContainer(
          showBoxShadow: true,
          backgroundColor: AppColors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: RoundedContainer(
                    height: 40,
                    width: 40,
                    radius: 100,
                    showBorder: true,
                    borderColor: AppColors.grey,
                    backgroundColor: AppColors.white,
                    child: Icon(Iconsax.arrow_left, color: AppColors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: AppSizes.defaultSpace),
                child: BlocBuilder<WishlistCubit, WishlistState>(
                  builder: (context, state) {
                    return CircularIcon(
                        height: 40,
                        width: 40,
                        color: Colors.red.shade400,
                        backgroundColor: AppColors.lightGrey,
                        onPressed: () {
                          context
                              .read<WishlistCubit>()
                              .addToWishlist(widget.id);
                        },
                        icon: context
                                .watch<WishlistCubit>()
                                .wishlistContains(widget.id)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}