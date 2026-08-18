import 'package:flutter/material.dart';
class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.currencySign = "NPR ",
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.linethrough = false,
  });
  final String currencySign, price;
  final int maxLines;
  final bool isLarge, linethrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: linethrough ? TextDecoration.lineThrough : null,
              )
          : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: linethrough ? TextDecoration.lineThrough : null,
              ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}