import 'package:go_router/go_router.dart';
import '../../../core/routes/route_names.dart';
import '../../cart/presentation/bloc/cart_bloc.dart';
import 'widgets/categories_section.dart';
import 'widgets/special_offer_section.dart';
import 'home.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          backgroundColor: AppColors.white,
          onRefresh: () async {
            context
                .read<FeaturedProductCubit>()
                .fetchFeaturedProducts(FetchProductsReq());
            context
                .read<BudgetProductCubit>()
                .fetchBudgetProducts(FetchProductsReq());
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSizes.spaceBtwItems / 2),
                      DHomeAppBar(),
                      SizedBox(height: AppSizes.spaceBtwItems * 2),
                      GestureDetector(
                        onTap: () => context.pushNamed(RouteNames.search),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: CommonSearchbar(allowSearch: false)),
                            SizedBox(width: AppSizes.xs),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                HomeBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class HomeBody extends StatefulWidget {
  const HomeBody({super.key});
  @override
  State<HomeBody> createState() => _HomeBodyState();
}
class _HomeBodyState extends State<HomeBody> {
  int _currentIndex = 0;
  final List<String> imgs = [
    Assets.banners.img3.path,
    Assets.banners.img2.path,
    Assets.banners.img1.path,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          SpecialOffersSection(
            imgs: imgs,
            currentIndex: _currentIndex,
            onPageChanged: (index) => setState(() => _currentIndex = index),
          ),
          SizedBox(height: AppSizes.spaceBtwSections),
          CategoriesSection(),
          SizedBox(height: AppSizes.spaceBtwSections),
          AppSectionHeadings(
              title: AppTexts.featuredProducts,
              buttonTitle: AppTexts.viewAll,
              showActionButton: false),
          SizedBox(height: AppSizes.spaceBtwItems),
          FeaturedProductsSection(),
          SizedBox(height: AppSizes.spaceBtwSections),
          AppSectionHeadings(
              title: AppTexts.budgetProducts,
              buttonTitle: AppTexts.viewAll,
              showActionButton: false),
          SizedBox(height: AppSizes.spaceBtwItems),
          BudgetProductsSection(),
          SizedBox(height: AppSizes.spaceBtwInputFields),
        ],
      ),
    );
  }
}