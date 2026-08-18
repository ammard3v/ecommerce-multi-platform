import 'package:flutter/material.dart';
import 'package:eshop/common/widgets/texts/product_price.dart';
import 'package:eshop/features/cart/presentation/pages/widgets/add_remove_cart_items.dart';
import 'package:eshop/features/cart/presentation/pages/widgets/cart_item.dart';
import 'package:eshop/utils/constants/sizes.dart';
class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) =>
            SizedBox(height: AppSizes.spaceBtwItems),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CartItem(),
              if (showAddRemoveButton) SizedBox(height: AppSizes.spaceBtwItems),
              if (showAddRemoveButton)
                Row(children: [
                  SizedBox(width: 120),
                  AddRemoveQuantity(),
                  Spacer(),
                  ProductPriceText(price: "1200"),
                ])
            ],
          );
        });
  }
}