class AddToCartReq {
  final String productId;
  final int quantity;
  AddToCartReq({
    required this.productId,
    this.quantity = 1,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'productId': productId,
      'quantity': quantity,
    };
  }
}