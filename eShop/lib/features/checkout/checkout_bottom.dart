import 'package:eshop/common/widgets/modalbottomsheet/custom_bottom_sheet.dart';
import 'package:eshop/features/order/presentation/bloc/order_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:eshop/app/disabled_overlay.dart';
import 'package:eshop/common/widgets/snackbar/toast.dart';
import 'package:eshop/common/widgets/spinner/spinner.dart';
import 'package:eshop/core/routes/route_names.dart';
import 'package:eshop/features/checkout/widgets/billing_payment_section.dart';
import 'package:eshop/features/shop/home/home.dart';
import 'package:eshop/utils/constants/enums.dart';
class CheckoutBottom extends StatefulWidget {
  const CheckoutBottom({super.key});
  @override
  State<CheckoutBottom> createState() => _CheckoutBottomState();
}
class _CheckoutBottomState extends State<CheckoutBottom> {
  PaymentMethod selectedPaymentMethod = PaymentMethod.COD;
  @override
  Widget build(BuildContext context) {
    final dark = DeviceHelpers.isDarkMode(context);
    return SafeArea(
      child: Container(
        height: 380,
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        decoration: BoxDecoration(
          color: dark ? AppColors.darkBackground : AppColors.lightBackground,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentPending) {
              context.pushNamed(RouteNames.paymentProcessing,
                  extra: state.paymentIntentId);
            }
            if (state is PaymentFailure) {
              ToastHelper.show(context, message: state.message);
            }
          },
          builder: (context, isLoading) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BillingPaymentSection((value) {
                      if (value != null) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      }
                    }),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    SizedBox(
                      height: 50,
                      child: MainButton(
                        text: 'Confirm Payment',
                        backgroundColor: AppColors.primary,
                        onTap: () {
                          if (selectedPaymentMethod == PaymentMethod.STRIPE) {
                            context.read<PaymentCubit>().makePayment();
                            return;
                          }
                          if (selectedPaymentMethod == PaymentMethod.BANK ||
                              selectedPaymentMethod == PaymentMethod.EWALLET) {
                            ToastHelper.show(context,
                                message: "Not supported yet");
                            return;
                          }
                          if (selectedPaymentMethod == PaymentMethod.COD) {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (context) => SafeArea(
                                child: CustomBottomSheet(
                                  title: "Confirm Cash on Delivery",
                                  confirmText: "Place Order",
                                  onConfirm: () {
                                    context
                                        .read<OrderBloc>()
                                        .add(CreateOrderEvent());
                                    Navigator.pop(context);
                                  },
                                  cancelText: "Cancel",
                                  onCancel: () => Navigator.pop(context),
                                ),
                              ),
                            );
                            return;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}