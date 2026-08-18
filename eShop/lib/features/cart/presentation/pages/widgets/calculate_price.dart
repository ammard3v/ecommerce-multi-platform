import '../../../../../core/routes/route_barel.dart';
import '../../bloc/cart_bloc.dart';
class ReturnPriceTotal extends StatelessWidget {
  const ReturnPriceTotal({
    super.key,
    required this.state,
  });
  final CartLoadedState state;
  @override
  Widget build(BuildContext context) {
    final totalPrice = state.cart.fold<double>(
      0.0,
      (sum, item) =>
          sum +
          (item.product.price * (1 - item.product.discount / 100)) *
              item.quantity,
    );
    return Text(
      "Rs. ${totalPrice.toStringAsFixed(2)}",
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}