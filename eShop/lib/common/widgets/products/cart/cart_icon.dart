import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/routes/route_names.dart';
class DCartCountericon extends StatelessWidget {
  const DCartCountericon({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            context.pushNamed(RouteNames.cart);
          },
          icon: Icon(Iconsax.shopping_bag),
        ),
        Positioned(
          right: 1.0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '3',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(fontSizeFactor: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}