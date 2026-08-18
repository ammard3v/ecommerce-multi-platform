import 'package:eshop/common/widgets/snackbar/toast.dart';
import 'package:eshop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../common/widgets/appbar/custom_appbar.dart';
import '../navigation/cubit/navigation_bar_cubit.dart';
import '../order/domain/entity/order_entity.dart';
import '../../utils/constants/date_helper.dart';
import '../../common/widgets/button/main_button.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../order/presentation/pages/barel.dart';
class PaymentSucees extends StatelessWidget {
  const PaymentSucees({
    super.key,
    required this.orderEntity,
  });
  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    final isDark = DeviceHelpers.isDarkMode(context);
    Widget infoRow(String label, String value) {
      return Padding(
        padding: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async => false,
      child: Scaffold(
        appBar: DAppBar(
          title: Text('Payment'),
          resetStackRoute: '/navigationMenu',
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: RoundedContainer(
              backgroundColor: AppColors.transparent,
              showBoxShadow: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSizes.md),
                  RoundedContainer(
                    height: 120,
                    radius: 100,
                    backgroundColor: AppColors.transparent,
                    child: Lottie.asset(
                      repeat: false,
                      "assets/lottie/Success.json",
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  Text(
                    'Payment Successful.',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(fontWeightDelta: 3),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Successfully Paid Rs.${orderEntity.totalPrice}',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections * 2),
                  RoundedContainer(
                    radius: 30,
                    showBorder: true,
                    backgroundColor:
                        isDark ? AppColors.darkBackground : AppColors.white,
                    showBoxShadow: true,
                    padding: const EdgeInsets.all(AppSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transaction Details",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        infoRow("Transaction ID", orderEntity.id),
                        infoRow(
                          "Date",
                          DateHelper.formatDateTime(
                              orderEntity.createdAt.toIso8601String()),
                        ),
                        infoRow("Type of Transaction", "Stripe"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Status"),
                            Container(
                              padding: EdgeInsets.only(
                                  left: AppSizes.sm,
                                  right: AppSizes.sm,
                                  top: AppSizes.xs,
                                  bottom: AppSizes.xs),
                              decoration: BoxDecoration(
                                  color: AppColors.success.withValues(
                                    alpha: .1,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color:
                                        AppColors.success.withValues(alpha: .7),
                                  ),
                                  Text(
                                    orderEntity.paymentResult?.status == null
                                        ? "OOPS"
                                        : '${orderEntity.paymentResult!.status[0].toUpperCase()}${orderEntity.paymentResult!.status.substring(1)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(
                                            color: AppColors.success
                                                .withValues(alpha: .7)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 40,
                          child: IconButton(
                              onPressed: () => ToastHelper.show(context,
                                  message: "Not Supported yet."),
                              icon: Icon(Icons.download)),
                        ),
                        const SizedBox(width: AppSizes.spaceBtwSections),
                        Expanded(
                          child: MainButton(
                            text: "Go To Home",
                            onTap: () {
                              context
                                  .read<NavigationBarCubit>()
                                  .selectedNavigation(0);
                              context.read<CartBloc>().add(FetchCartEvent());
                              context.go('/navigationMenu');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}