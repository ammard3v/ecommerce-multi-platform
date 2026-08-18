import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/spinner/spinner.dart';
import '../../../../core/routes/route_barel.dart';
import '../../../shop/home/home.dart';
class TrackOrderScreen extends StatefulWidget {
  final String orderId;
  const TrackOrderScreen({super.key, required this.orderId});
  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}
class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(FetchOrderStatusEvent(widget.orderId));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        title: const Text("Track Order"),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
          child: RefreshIndicator(
            color: AppColors.primary,
            backgroundColor: AppColors.white,
            onRefresh: () async => context
                .read<OrderBloc>()
                .add(FetchOrderStatusEvent(widget.orderId)),
            child: BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                if (state is OrderLoadingState) {
                  return Spinner();
                } else if (state is SingleOrderLoadedState) {
                  final order = state.order;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RoundedContainer(
                        backgroundColor: AppColors.transparent,
                        padding: const EdgeInsets.all(AppSizes.sm),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: order.orderItems.length,
                          separatorBuilder: (_, __) =>
                              const Divider(color: Colors.white24),
                          itemBuilder: (context, index) {
                            final item = order.orderItems[index];
                            return ListTile(
                              leading: CacheImage(item.image),
                              title: Text(
                                item.title,
                                style: const TextStyle(color: AppColors.white),
                              ),
                              subtitle: Text(
                                "Qty: ${item.quantity}",
                                style: const TextStyle(color: Colors.white70),
                              ),
                              trailing: Text(
                                "Rs ${item.price}",
                                style: const TextStyle(color: AppColors.white),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: AppSizes.defaultSpace),
                      Text("Order Status Details",
                          style: Theme.of(context).textTheme.titleMedium),
                      SizedBox(height: AppSizes.defaultSpace),
                      Expanded(
                        child: OrderTrackStepper(
                          order: order,
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
class OrderTrackStepper extends StatelessWidget {
  final OrderEntity order;
  const OrderTrackStepper({
    super.key,
    required this.order,
  });
  int _getStepIndex(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return 0;
      case "confirmed":
        return 1;
      case "shipped":
        return 2;
      case "delivered":
        return 3;
      case "cancelled":
        return 4;
      default:
        return 0;
    }
  }
  @override
  Widget build(BuildContext context) {
    final stepIndex = _getStepIndex(order.status);
    final pendingDate = order.createdAt;
    final confirmedDate = order.createdAt;
    final shippedDate = order.shippedAt ?? DateTime.now();
    final deliveredDate = order.deliveredAt ?? DateTime.now();
    return Stepper(
      currentStep: stepIndex,
      type: StepperType.vertical,
      physics: const NeverScrollableScrollPhysics(),
      controlsBuilder: (_, __) => const SizedBox(),
      steps: [
        Step(
          title: const Text("Pending"),
          content: ListTile(
              title: Text(
                  "Pending: ${DeviceHelpers.getFormattedDate(pendingDate)}")),
          isActive: order.status.toLowerCase() == "pending",
          state: stepIndex > 0 && order.status.toLowerCase() != "cancelled"
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: const Text("Confirmed"),
          content: ListTile(
              title: Text(
                  "Confirmed: ${DeviceHelpers.getFormattedDate(confirmedDate)}")),
          isActive: order.status.toLowerCase() == "confirmed",
          state: stepIndex > 1 && order.status.toLowerCase() != "cancelled"
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: const Text("Shipped"),
          content: ListTile(
              title: Text(
                  "Shipped On: ${DeviceHelpers.getFormattedDate(shippedDate)}")),
          isActive: order.status.toLowerCase() == "shipped",
          state: stepIndex > 2 && order.status.toLowerCase() != "cancelled"
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: const Text("Delivered"),
          content: ListTile(
              title: Text(
                  "Delivered On: ${DeviceHelpers.getFormattedDate(deliveredDate)}")),
          isActive: order.status.toLowerCase() == "delivered",
          state: stepIndex > 3 && order.status.toLowerCase() != "cancelled"
              ? StepState.complete
              : StepState.indexed,
        ),
        Step(
          title: const Text("Canceled"),
          content: ListTile(
              title: Text(
                  "Canceled On: ${DeviceHelpers.getFormattedDate(deliveredDate)}")),
          isActive: order.status.toLowerCase() == "cancelled",
          state: order.status.toLowerCase() == "cancelled"
              ? StepState.complete
              : StepState.indexed,
        ),
      ],
    );
  }
}