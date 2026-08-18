import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/images/cache_image.dart';
import '../../../../common/widgets/texts/section_headings.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/device_helpers.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../category/presentation/bloc/category_bloc.dart';
import 'category_shimmer.dart';
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSectionHeadings(
          title: 'Categories',
          buttonTitle: AppTexts.viewAll,
          onPressed: () => context.pushNamed(RouteNames.category),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        SizedBox(
          height: 120,
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryInitial || state is CategoryLoading) {
                return const CategoriesShimmer();
              }
              if (state is CategoryLoadedAll) {
                final category = state.categories;
                if (category.isEmpty) return Text(AppTexts.sthWentNorth);
                final dark = DeviceHelpers.isDarkMode(context);
                return SizedBox(
                  width: DeviceHelpers.screenWidth(context) - 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () => context.pushNamed(
                            RouteNames.productByCategory,
                            queryParameters: {
                              "id": category[index].id,
                              "title": category[index].title
                            }),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedContainer(
                              showBorder: true,
                              height: 80,
                              width: 80,
                              backgroundColor: dark
                                  ? AppColors.darkerGrey
                                  : AppColors.lightGrey,
                              radius: 80,
                              child: CacheImage(
                                category[index].image,
                                showbgColor: true,
                              ),
                            ),
                            SizedBox(height: AppSizes.spaceBtwItems),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              category[index].title,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ),
      ],
    );
  }
}