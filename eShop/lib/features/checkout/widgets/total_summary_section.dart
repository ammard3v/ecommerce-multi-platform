import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/constants/device_helpers.dart';
import '../../../common/widgets/button/main_button.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../cart/data/model/cart_model.dart';
import '../../cart/domain/repository/repository.dart';
import '../../cart/presentation/bloc/cart_bloc.dart';
import '../../cart/presentation/pages/widgets/calculate_price.dart';
import '../../../utils/constants/api_constants.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
class TotalSummarySection extends StatelessWidget {
  const TotalSummarySection({super.key, required this.state});
  final List<CartEntity> state;
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return RoundedContainer(
      backgroundColor: dark ? AppColors.darkBackground : AppColors.lightGrey,
      padding: EdgeInsets.all(AppSizes.defaultSpace),
      child: BlocSelector<CartBloc, CartState, bool>(
        selector: (state) => state is CartLoadedState && state.cart.isNotEmpty,
        builder: (context, isLoaded) {
          if (isLoaded) {
            return Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub-Total"),
                      Text("Rs.${state.subTotal}")
                    ]),
                SizedBox(height: AppSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery fee"),
                    Text("Rs.${Constants.deliveryFee}")
                  ],
                ),
                SizedBox(height: AppSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount"),
                    Text("- Rs.${state.totalDiscountAmount}")
                  ],
                ),
                SizedBox(height: AppSizes.spaceBtwItems),
                DottedLine(
                  dashColor: AppColors.darkGrey,
                ),
                SizedBox(height: AppSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Cost"),
                    Text("Rs.${state.totalPrice + Constants.deliveryFee}")
                  ],
                ),
              ],
            );
          }
          return Text("oops");
        },
      ),
    );
  }
}