import 'package:eshop/core/routes/route_barel.dart';
import 'package:iconsax/iconsax.dart';
import 'package:input_quantity/input_quantity.dart';
import '../../../../order/presentation/pages/barel.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/cache_image.dart';
import '../../../../../common/widgets/modalbottomsheet/custom_bottom_sheet.dart';
import '../../../data/repository/repository.dart';
import '../../bloc/cart_bloc.dart';
class ListViewCart extends StatelessWidget {
  const ListViewCart({super.key, required this.cart});
  final List<CartEntity> cart;
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: cart.length,
      separatorBuilder: (_, __) => SizedBox(height: AppSizes.md),
      itemBuilder: (context, index) {
        final product = cart[index].product;
        final quantity = cart[index].quantity;
        return GestureDetector(
          onTap: () =>
              context.pushNamed(RouteNames.singleProduct, extra: product.id),
          child: Stack(children: [
            RoundedContainer(
              padding: EdgeInsets.all(AppSizes.md),
              backgroundColor:
                  dark ? AppColors.darkBackground : AppColors.lightGrey,
              radius: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundedContainer(
                    height: 120,
                    width: 120,
                    showBoxShadow: false,
                    backgroundColor: AppColors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: CacheImage(
                        product.image,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSizes.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.title),
                        SizedBox(height: 10),
                        Text("${product.discount.toString()}% off"),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product.price.toString()),
                            InputQty.int(
                              qtyFormProps: QtyFormProps(
                                enableTyping: false,
                                showCursor: false,
                              ),
                              decoration: QtyDecorationProps(
                                btnColor: AppColors.primary,
                                borderShape: BorderShapeBtn.circle,
                                isBordered: false,
                              ),
                              minVal: 1,
                              maxVal: product.stock,
                              initVal: quantity,
                              onQtyChanged: (value) {
                                context.read<CartBloc>().add(
                                      UpdateCartEvent(
                                        AddToCartReq(
                                          productId: product.id,
                                          quantity: value,
                                        ),
                                      ),
                                    );
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSizes.xs),
                ],
              ),
            ),
            Positioned(
                right: 10,
                top: 8,
                child: IconButton(
                  icon: Icon(Iconsax.trash),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) => SafeArea(
                        child: CustomBottomSheet(
                          title: "Remove from Cart?",
                          confirmText: "Yes, Remove",
                          onConfirm: () {
                            context
                                .read<CartBloc>()
                                .add(DeleteFromCartEvent(product.id));
                            Navigator.pop(context);
                          },
                          cancelText: "Cancel",
                          onCancel: () => Navigator.pop(context),
                        ),
                      ),
                    );
                  },
                ))
          ]),
        );
      },
    );
  }
}