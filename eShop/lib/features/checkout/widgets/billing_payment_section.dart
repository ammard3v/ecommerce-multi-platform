import 'package:eshop/features/shop/home/home.dart';
import 'package:eshop/utils/constants/enums.dart';
class BillingPaymentSection extends StatefulWidget {
  const BillingPaymentSection(
    this.selectedValue, {
    super.key,
  });
  final ValueChanged<PaymentMethod?> selectedValue;
  @override
  State<BillingPaymentSection> createState() => _BillingPaymentSectionState();
}
class _BillingPaymentSectionState extends State<BillingPaymentSection> {
  PaymentMethod? _selectedPaymentMethod = PaymentMethod.COD;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppSizes.spaceBtwItems),
        ...PaymentMethod.values.map((method) {
          return RoundedContainer(
            backgroundColor: Colors.transparent,
            radius: 0,
            child: RadioListTile<PaymentMethod>(
              title: Text(
                method.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              value: method,
              groupValue: _selectedPaymentMethod,
              onChanged: (PaymentMethod? value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
                widget.selectedValue(value);
              },
              contentPadding: const EdgeInsets.only(left: AppSizes.xs),
            ),
          );
        }),
      ],
    );
  }
}