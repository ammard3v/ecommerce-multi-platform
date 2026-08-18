import '../../common/widgets/snackbar/toast.dart';
import '../navigation/cubit/navigation_bar_cubit.dart';
import '../order/presentation/bloc/order_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../cart/data/repository/repository.dart';
import 'checkout_bottom.dart';
import '../../common/widgets/modalbottomsheet/custom_bottom_sheet.dart';
import '../../core/routes/route_names.dart';
import 'widgets/promo_code.dart';
import 'widgets/total_summary_section.dart';
import '../order/data/repository/repository.dart';
import '../../common/widgets/appbar/custom_appbar.dart';
import '../admin/admin_product/widgets/input_fields.dart';
import '../shop/home/home.dart';
import '../cart/presentation/bloc/cart_bloc.dart';
import 'widgets/billing_address_section.dart';
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is SingleOrderLoadedState) {
          context.read<NavigationBarCubit>().selectedNavigation(0);
          context.go("/navigationMenu");
        }
        if (state is OrderFailureState) {
          ToastHelper.show(context, message: state.message);
          context.read<NavigationBarCubit>().selectedNavigation(0);
          context.go("/navigationMenu");
        }
      },
      child: Scaffold(
        appBar: DAppBar(
          showBackArrow: true,
          title: Text('Checkout'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
              child: Column(
                children: [
                  BlocConsumer<CartBloc, CartState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is CartLoadedState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BillingAddressSection(),
                            SizedBox(height: AppSizes.spaceBtwSections),
                            AppSectionHeadings(
                                title: 'Order List', buttonTitle: ''),
                            SizedBox(height: AppSizes.spaceBtwInputFields),
                            CheckoutListView(cart: state.cart),
                            SizedBox(height: AppSizes.spaceBtwSections),
                            PromoCodeHelper(),
                            TotalSummarySection(state: state.cart),
                            SizedBox(height: AppSizes.spaceBtwSections),
                            BlocSelector<AddressBloc, AddressState, bool>(
                              selector: (state) =>
                                  state is AllAddressLoadedState &&
                                  state.addressesDataEntity.isNotEmpty,
                              builder: (context, address) {
                                return BlocSelector<CartBloc, CartState, bool>(
                                  selector: (state) =>
                                      state is CartLoadedState &&
                                      state.cart.isNotEmpty,
                                  builder: (context, cart) {
                                    if (!cart) {
                                      return MainButton(
                                        radius: 30,
                                        backgroundColor:
                                            AppColors.buttonDisabled,
                                        text: 'Cart is Empty',
                                        onTap: null,
                                      );
                                    }
                                    if (!address) {
                                      return MainButton(
                                        radius: 30,
                                        backgroundColor:
                                            AppColors.buttonDisabled,
                                        text: 'Please add billing address!',
                                        onTap: null,
                                      );
                                    }
                                    return MainButton(
                                      radius: 30,
                                      text: 'Continue to Payment',
                                      onTap: () => showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        isScrollControlled: true,
                                        builder: (context) => SafeArea(
                                          child: CheckoutBottom(),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            SizedBox(height: AppSizes.spaceBtwSections),
                          ],
                        );
                      }
                      return Text('STH WNET WRMG');
                    },
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class CheckoutListView extends StatelessWidget {
  const CheckoutListView({
    super.key,
    required this.cart,
  });
  final List<CartEntity> cart;
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: cart.length,
      separatorBuilder: (_, __) => SizedBox(height: AppSizes.md),
      itemBuilder: (context, index) {
        final product = cart[index].product;
        return Stack(children: [
          RoundedContainer(
            showBoxShadow: true,
            padding: EdgeInsets.all(AppSizes.md),
            backgroundColor: dark
                ? AppColors.darkBackground
                : AppColors.grey.withValues(alpha: .5),
            radius: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoundedContainer(
                  height: 120,
                  width: 120,
                  backgroundColor: AppColors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: CacheImage(
                      product.image,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title),
                      SizedBox(height: 10),
                      Text("${product.discount.toString()}% off"),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.price.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppSizes.xs),
              ],
            ),
          ),
          Positioned(
            right: 14,
            bottom: 20,
            child: RoundedContainer(
                backgroundColor: dark ? AppColors.darkGrey : AppColors.softGrey,
                height: 24,
                width: 24,
                radius: 24,
                child: Text(cart[index].quantity.toString())),
          )
        ]);
      },
    );
  }
}