import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/products/data/repository/repository.dart';
class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.index,
    required this.product,
  });
  final int index;
  final SingleProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
            Spacer(),
            Row(
              children: [
                RatingBarIndicator(
                  rating: product.ratings.average,
                  itemCount: 1,
                  itemSize: 25,
                  itemBuilder: (context, _) => const Icon(
                    Iconsax.star1,
                    color: Colors.yellow,
                  ),
                ),
                Text(product.ratings.average.toString()),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Rs ${product.price}"),
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.add_square5),
            ),
          ],
        ),
      ],
    );
  }
}