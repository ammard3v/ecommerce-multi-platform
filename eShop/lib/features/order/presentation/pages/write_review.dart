import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:eshop/common/widgets/button/main_button.dart';
import 'package:eshop/core/routes/route_barel.dart';
import 'package:eshop/features/admin/admin_product/widgets/input_fields.dart';
import 'package:eshop/features/review/data/model/create_review.dart';
import 'package:eshop/features/review/presentation/bloc/review_bloc.dart';
import 'package:eshop/gen/assets.gen.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/sizes.dart';
class WriteReview extends StatefulWidget {
  const WriteReview({
    super.key,
    required this.product,
    required this.id,
  });
  final OrderItemsEntity product;
  final String id;
  @override
  State<WriteReview> createState() => _WriteReviewState();
}
class _WriteReviewState extends State<WriteReview> {
  final TextEditingController _reviewController = TextEditingController();
  double ratingValue = 1.0;
  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const Text(
                "Write a Review",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(widget.product.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Qty: ${widget.product.quantity}",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    RatingBar(
                      initialRating: ratingValue,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full: Assets.ratings.heart.image(
                          color: AppColors.secondary,
                          height: 32,
                        ),
                        half: Assets.ratings.heartHalf.image(
                          color: AppColors.secondary,
                          height: 32,
                        ),
                        empty: Assets.ratings.heartBorder.image(
                          color: AppColors.secondary,
                          height: 32,
                        ),
                      ),
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        setState(() {
                          ratingValue = rating;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Your Review",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              InputFields(
                controller: _reviewController,
                hintText: "Share your experience...",
              ),
              const SizedBox(height: 25),
              MainButton(
                text: "Submit Review",
                onTap: () {
                  final review = _reviewController.text.trim();
                  if (review.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please write a review'),
                        backgroundColor: Colors.orange,
                      ),
                    );
                    return;
                  }
                  context.read<ReviewBloc>().add(
                        WriteReviewEvent(
                          productId: widget.product.product,
                          createReview: CreateReview(
                            review: review,
                            rating: ratingValue,
                            orderId: widget.id,
                          ),
                        ),
                      );
                  Navigator.pop(context);
                  GoRouter.of(context).go('/navigationMenu');
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}