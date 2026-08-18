import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../domain/entity/wishlist_entity.dart';
class CommonProductCardBody extends StatelessWidget {
  const CommonProductCardBody({
    super.key,
    required this.wishlistEntity,
  });
  final WishlistEntity wishlistEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(wishlistEntity.title,
            maxLines: 1, overflow: TextOverflow.ellipsis),
        Row(
          children: [
            RatingBarIndicator(
              rating: wishlistEntity.ratingAvg.toDouble(),
              itemCount: 1,
              itemSize: 20,
              itemBuilder: (context, _) => const Icon(
                Iconsax.star1,
                color: Colors.yellow,
              ),
            ),
            Text(wishlistEntity.ratingAvg.toString()),
            Text(" | ${wishlistEntity.stock} Available")
          ],
        ),
        SizedBox(height: AppSizes.xs),
        Text("Rs ${wishlistEntity.price}"),
      ],
    );
  }
}