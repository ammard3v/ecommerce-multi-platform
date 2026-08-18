import 'package:go_router/go_router.dart';
import '../../common/widgets/spinner/center_spinner.dart';
import '../../common/widgets/spinner/spinner.dart';
import '../../core/routes/route_names.dart';
import '../order/presentation/bloc/order_bloc.dart';
import '../shop/home/home.dart';
class PaymentProcessing extends StatefulWidget {
  const PaymentProcessing({super.key, required this.id});
  final String id;
  @override
  State<PaymentProcessing> createState() => _PaymentProcessingState();
}
class _PaymentProcessingState extends State<PaymentProcessing> {
  @override
  void initState() {
    super.initState();
    _checkPaymentStatus();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) => {
          if (state is SingleOrderLoadedState)
            context.pushNamed(RouteNames.paymentSuccess, extra: state.order)
        },
        builder: (context, state) {
          if (state is PaymentOrderFailureState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.defaultSpace),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Sth wnet nrth"),
                      SizedBox(height: AppSizes.defaultSpace),
                      MainButton(
                        text: "Go to Home",
                        onTap: () => {context.go('/navigationMenu')},
                      )
                    ]),
              ),
            );
          }
          return Spinner();
        },
      ),
    );
  }
  void _checkPaymentStatus() async {
    context.read<OrderBloc>().add(FetchPaidOrderStatusEvent(id: widget.id));
  }
}