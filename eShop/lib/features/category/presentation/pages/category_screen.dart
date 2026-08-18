import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/images/cache_image.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/device_helpers.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/global_user.dart';
import '../../../shop/home/widgets/category_shimmer.dart';
import '../bloc/category_bloc.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryPageState();
}
class _CategoryPageState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<CategoryBloc>();
    final state = bloc.state;
    if (state is! CategoryLoadedAll && state is! CategoryLoading) {
      bloc.add(FetchAllCategory());
    }
  }
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return Scaffold(
      appBar: DAppBar(title: Text('All Categories'), showBackArrow: true),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return CategoriesShimmer();
            }
            if (state is CategoryLoadedAll) {
              final category = state.categories;
              return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 12,
                    maxCrossAxisExtent: 120,
                    mainAxisExtent: 130,
                  ),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => context.pushNamed(
                            RouteNames.productByCategory,
                            queryParameters: {
                              "id": category[index].id,
                              "title": category[index].title
                            }),
                        child: SizedBox(
                          height: 120,
                          width: 120,
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
                        ),
                      ));
            }
            return Text('ntg');
          },
        ),
      ),
      floatingActionButton: GlobalUser.userData(context)!.role == "admin"
          ? FloatingActionButton(
              onPressed: () => context.pushNamed(RouteNames.createCategory),
              child: Icon(Iconsax.add),
            )
          : null,
    );
  }
}