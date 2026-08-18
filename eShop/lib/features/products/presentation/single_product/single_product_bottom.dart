import 'package:eshop/common/widgets/snackbar/toast.dart';
import 'package:eshop/core/routes/route_names.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/button/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../cart/domain/usecase/usecase.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/device_helpers.dart';
import '../../../../utils/constants/sizes.dart';
class SingleProductBottom extends StatelessWidget {
  const SingleProductBottom({
    super.key,
    required this.id,
    required this.price,
  });
  final String id;
  final double price;
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return SafeArea(
      child: RoundedContainer(
        height: AppSizes.appBarHeight * 1.5,
        backgroundColor: dark ? AppColors.black : AppColors.softGrey,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultSpace),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: dark
                                ? AppColors.darkGrey
                                : AppColors.darkerGrey),
                      ),
                      const SizedBox(height: AppSizes.xs),
                      Text(
                        'Rs.$price',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color:
                                  dark ? AppColors.textWhite : AppColors.black,
                            ),
                      )
                    ]),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppSizes.md,
                    bottom: AppSizes.md,
                    right: AppSizes.defaultSpace,
                  ),
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is! CartLoadedState) {
                        return MainButton(showText: false);
                      }
                      final inCart =
                          state.cart.any((item) => item.product.id == id);
                      final isLoading = state.loadingIds.contains(id);
                      return BlocListener<CartBloc, CartState>(
                        listener: (context, state) {
                          if (state is CartLoadedState &&
                              state.message.isNotEmpty) {
                            ToastHelper.show(context,
                                message: state.message, type: ToastType.error);
                          }
                        },
                        child: Material(
                          color: inCart
                              ? AppColors.buttonDisabled
                              : AppColors.primary,
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: isLoading
                                ? null
                                : () {
                                    if (inCart) {
                                      context.pushNamed(RouteNames.cart);
                                    } else {
                                      context.read<CartBloc>().add(
                                            AddToCartEvent(
                                              AddToCartReq(productId: id),
                                            ),
                                          );
                                    }
                                  },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 14,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (isLoading)
                                    const SizedBox(
                                      height: 18,
                                      width: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  SizedBox(width: AppSizes.sm),
                                  Text(
                                    isLoading
                                        ? ""
                                        : inCart
                                            ? 'Go to Cart'
                                            : 'Add to Cart',
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}