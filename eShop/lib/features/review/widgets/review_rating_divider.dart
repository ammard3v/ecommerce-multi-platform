import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:eshop/features/review/domain/entity/review_entity.dart';
import 'package:eshop/utils/constants/colors.dart';
class ReviewRatingDivider extends StatelessWidget {
  const ReviewRatingDivider({
    super.key,
    required this.reviewEntity,
  });
  final ReviewEntity reviewEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(reviewEntity.averageReview.toString()),
              RatingBarIndicator(
                rating: reviewEntity.averageReview,
                itemCount: 5,
                itemSize: 25,
                itemBuilder: (context, _) => const Icon(
                  Iconsax.star1,
                  color: Colors.yellow,
                ),
              ),
              Text("(${reviewEntity.reviewCount} reviews)"),
            ],
          ),
          Container(
            width: 2,
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
                bottom: Radius.circular(8),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(reviewEntity.ratingsMap.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: Text(
                          (5 - index).toString(),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(8),
                              right: Radius.circular(8)),
                          minHeight: 8,
                          value: reviewEntity.ratingsMap[index],
                          backgroundColor: AppColors.grey,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}