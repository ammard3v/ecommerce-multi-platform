import 'package:eshop/features/order/presentation/pages/write_review.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../admin/admin_product/widgets/input_fields.dart';
import '../../../review/data/model/create_review.dart';
import '../../../review/presentation/bloc/review_bloc.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/spinner/center_spinner.dart';
import '../../../../core/routes/route_names.dart';
import '../../../shop/home/home.dart';
import '../../domain/entity/order_entity.dart';
import '../bloc/order_bloc.dart';
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}
class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(FetchOrderEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        leadingOnPressed: () => Navigator.pop(context),
        title: const Text('Orders'),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async =>
              context.read<OrderBloc>().add(FetchOrderEvent()),
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state is OrderLoadingState) {
                return const Center(child: CenterSpinner());
              }
              if (state is OrderLoadedState) {
                final pendingOrders =
                    state.order.where((e) => e.status != 'delivered').toList();
                final completedOrders =
                    state.order.where((e) => e.status == 'delivered').toList();
                if (state.order.isEmpty) {
                  return const Center(child: Text('No Orders Found'));
                }
                return DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: AppColors.buttonPrimary,
                        unselectedLabelColor: AppColors.buttonSecondary,
                        indicatorColor: AppColors.buttonPrimary,
                        tabs: const [
                          Tab(text: "Pending"),
                          Tab(text: "Completed"),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            FilteredOrder(
                              order: pendingOrders,
                            ),
                            FilteredOrder(order: completedOrders),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
class FilteredOrder extends StatelessWidget {
  const FilteredOrder({super.key, required this.order});
  final List<OrderEntity> order;
  @override
  Widget build(BuildContext context) {
    bool isDark = DeviceHelpers.isDarkMode(context);
    if (order.isEmpty) {
      return const Center(child: Text("No Orders"));
    }
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemCount: order.length,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final currentOrder = order[index];
        final isCompleted = currentOrder.status == 'delivered';
        final product = currentOrder.orderItems.isNotEmpty
            ? currentOrder.orderItems.first
            : null;
        if (product == null) return const SizedBox();
        return Stack(
          children: [
            InkWell(
              onTap: () {
                context.pushNamed(
                  RouteNames.trackOrder,
                  extra: currentOrder.id,
                );
              },
              borderRadius: BorderRadius.circular(20),
              child: RoundedContainer(
                padding: const EdgeInsets.all(12),
                backgroundColor: isDark ? AppColors.darkerGrey : AppColors.grey,
                radius: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundedContainer(
                      height: 120,
                      width: 120,
                      showBoxShadow: true,
                      backgroundColor: AppColors.darkBackground,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CacheImage(
                          product.image,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text("Status: ${currentOrder.status}"),
                          const SizedBox(height: 6),
                          Text(
                            "Qty: ${product.quantity} | Price: Rs ${product.price.toStringAsFixed(2)}",
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Total: Rs ${currentOrder.totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: isCompleted
                  ? 
                  !currentOrder.hasReviewed
                      ? TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: AppColors.black,
                              isScrollControlled: true,
                              builder: (context) => WriteReview(
                                id: currentOrder.id,
                                product: product, 
                              ),
                            );
                          },
                          child: const Text(
                            "Review Now",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Iconsax.star,
                                color: AppColors.secondary,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                "Reviewed",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                  : 
                  currentOrder.status == 'cancelled'
                      ? const SizedBox()
                      : TextButton(
                          onPressed: () => context.pushNamed(
                            RouteNames.trackOrder,
                            extra: currentOrder.id,
                          ),
                          child: const Text(
                            "Track Order",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
            ),
          ],
        );
      },
    );
  }
}