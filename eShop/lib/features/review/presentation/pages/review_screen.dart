import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eshop/common/widgets/spinner/spinner.dart';
import '../../../../common/screens/common_searchbar.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/loader/loader.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/global_user.dart';
import '../../widgets/horizontal_divider.dart';
import '../../widgets/review_rating_divider.dart';
import '../../widgets/review_users_list.dart';
import '../bloc/review_bloc.dart';
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}
class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<ReviewBloc>()
        .add(FetchProductReviewEvent(productId: widget.productId));
  }
  @override
  Widget build(BuildContext context) {
    bool allowReview = false;
    return Scaffold(
        appBar: DAppBar(
          showBackArrow: true,
          title: Text('Reviews'),
        ),
        body: BlocBuilder<ReviewBloc, ReviewState>(
          builder: (context, state) {
            if (state is ReviewInitialState) {
              return Text("intital");
            }
            if (state is ReviewLoadingState) {
              return Spinner();
            }
            if (state is ReviewLoadedState) {
              final reviewEntity = state.review;
              String? userId = GlobalUser.userId(context);
              bool hasReviewed =
                  reviewEntity.reviews.any((e) => e.userId.id == userId);
              allowReview = !hasReviewed;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReviewRatingDivider(reviewEntity: reviewEntity),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      HorizontalDivider(),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      CommonSearchbar(searchLabel: 'Search in reviews'),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      UsersReviewList(reviewEntity: reviewEntity)
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
        bottomNavigationBar: allowReview
            ? SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 2.0, color: AppColors.darkerGrey)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.all(AppSizes.defaultSpace),
                  child: ElevatedButton(
                      onPressed: () {}, child: Text('Write a Review')),
                ),
              )
            : null);
  }
}