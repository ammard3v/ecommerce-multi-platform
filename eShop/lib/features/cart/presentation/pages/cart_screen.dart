import 'package:eshop/common/widgets/appbar/custom_appbar.dart';
import 'package:eshop/common/widgets/spinner/center_spinner.dart';
import 'package:eshop/core/routes/route_barel.dart';
import 'package:eshop/features/address/presentation/bloc/address_bloc.dart';
import 'package:eshop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:eshop/features/cart/presentation/pages/widgets/cart_bottom_navbar.dart';
import 'package:eshop/features/cart/presentation/pages/widgets/list_view_cart.dart';
import 'package:eshop/gen/assets.gen.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/device/device_utility.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<CartBloc>();
    bloc.add(FetchCartEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        title: Text('Cart'),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          backgroundColor: AppColors.white,
          onRefresh: () async => context.read<CartBloc>().add(FetchCartEvent()),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                    if (state is CartLoadingState) {
                      return CenterSpinner();
                    }
                    if (state is CartLoadedState) {
                      final cart = state.cart;
                      if (cart.isNotEmpty) {
                        return Column(
                          children: [
                            ListViewCart(cart: cart),
                          ],
                        );
                      } else {
                        return SizedBox(
                          height: DeviceUtility.screenHeight(context) / 2,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Assets.defaults.emptyCart.image(),
                                SizedBox(height: AppSizes.spaceBtwItems),
                                Text('Your Cart is Empty')
                              ],
                            ),
                          ),
                        );
                      }
                    }
                    return Text("Please Referesh the page");
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, cartState) {
          final hasCart =
              cartState is CartLoadedState && cartState.cart.isNotEmpty;
          if (!hasCart) return const SizedBox.shrink();
          return BlocBuilder<AddressBloc, AddressState>(
            builder: (context, addressState) {
              final hasDefaultAddress = addressState is AllAddressLoadedState &&
                  addressState.addressesDataEntity.any((e) => e.isDefault);
              if (!hasDefaultAddress) {
                return CartBottomNavbar(
                  text: "Add Address First!",
                  onTap: () => context.pushNamed(RouteNames.address),
                );
              }
              return CartBottomNavbar(
                text: "Checkout",
                onTap: () => context.pushNamed(RouteNames.checkout),
              );
            },
          );
        },
      ),
    );
  }
}