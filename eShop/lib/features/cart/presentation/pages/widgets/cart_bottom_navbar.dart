import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/cubits/app_user/app_user_cubit.dart';
import '../../../../../core/routes/route_names.dart';
import '../../../../order/presentation/pages/barel.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../data/repository/repository.dart';
import '../../../../order/data/repository/repository.dart';
import '../../../../../common/widgets/button/main_button.dart';
import 'calculate_price.dart';
import '../../bloc/cart_bloc.dart';
class CartBottomNavbar extends StatelessWidget {
  const CartBottomNavbar({super.key, required this.text, required this.onTap});
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    final isDark = DeviceHelpers.isDarkMode(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState && state.cart.isNotEmpty) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
                color: isDark ? AppColors.darkBackground : AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Price",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text(
                      'Rs. ${state.cart.totalPrice.toString()}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(fontWeightDelta: 5),
                    ),
                  ],
                ),
                SizedBox(
                  width: 200,
                  child: MainButton(
                    radius: 30,
                    onTap: onTap,
                    text: text,
                  ),
                )
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}