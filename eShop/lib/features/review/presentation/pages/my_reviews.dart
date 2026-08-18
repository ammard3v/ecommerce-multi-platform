import 'package:eshop/core/routes/route_names.dart';
import 'package:eshop/features/order/presentation/pages/barel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eshop/common/widgets/spinner/spinner.dart';
import 'package:go_router/go_router.dart';
import '../bloc/review_bloc.dart';
class MyReviews extends StatefulWidget {
  const MyReviews({super.key});
  @override
  State<MyReviews> createState() => _MyReviewsState();
}
class _MyReviewsState extends State<MyReviews> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<ReviewBloc>();
    if (bloc.state is! FetchUserReviewsEvent) {
      Future.microtask(() {
        bloc.add(FetchUserReviewsEvent());
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final isDark = DeviceHelpers.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Reviews"),
      ),
      body: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          if (state is ReviewLoadingState) {
            return const Center(child: Spinner());
          }
          if (state is ReviewFailureState) {
            return Center(child: Text(state.message));
          }
          if (state is UserReviewLoadedState) {
            final reviews = state.review;
            if (reviews.isEmpty) {
              return const Center(child: Text("No reviews yet"));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: reviews.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final review = reviews[index];
                return GestureDetector(
                  onTap: () => context.pushNamed(RouteNames.singleProduct,
                      extra: review.product),
                  child: RoundedContainer(
                    backgroundColor:
                        isDark ? AppColors.darkerGrey : AppColors.white,
                    showBoxShadow: true,
                    showBorder: true,
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              review.id,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.orange, size: 18),
                                const SizedBox(width: 4),
                                Text(review.rating.toString()),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          review.review,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Product: ${review.product}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}