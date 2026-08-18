import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/helpers/global_user.dart';
import '../../../common/widgets/images/rounded_image.dart';
import '../../../gen/assets.gen.dart';
import '../../order/presentation/pages/barel.dart';
import '../domain/entity/review_entity.dart';
class UsersReviewList extends StatelessWidget {
  const UsersReviewList({
    super.key,
    required this.reviewEntity,
  });
  final ReviewEntity reviewEntity;
  @override
  Widget build(BuildContext context) {
    String? userId = GlobalUser.userId(context);
    return ListView.separated(
      separatorBuilder: (context, index) =>
          SizedBox(height: AppSizes.spaceBtwItems),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: reviewEntity.reviews.length,
      itemBuilder: (context, index) {
        final review = reviewEntity.reviews[index];
        final isCurrentUser = userId != null && review.userId.id == userId;
        final displayName = isCurrentUser ? 'Your Review' : review.userId.name;
        return Container(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  RoundedImage(
                    height: 40,
                    width: 40,
                    imageUrl: Assets.defaults.defaultUser.path,
                  ),
                  SizedBox(width: 10),
                  Text(displayName),
                  Spacer(),
                  Text(DeviceHelpers.getFormattedDate(review.createdAt)),
                ],
              ),
              SizedBox(height: AppSizes.spaceBtwItems / 2),
              Text(
                review.review,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: review.rating,
                    itemCount: 5,
                    itemSize: 25,
                    itemBuilder: (context, _) => const Icon(
                      Iconsax.star1,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(review.rating.toString()),
                ],
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              Divider(
                height: 2,
                color: AppColors.borderPrimary,
              ),
            ],
          ),
        );
      },
    );
  }
}