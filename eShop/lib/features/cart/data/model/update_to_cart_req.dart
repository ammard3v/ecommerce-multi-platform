class UpdateToCartReq {
  final String productId;
  final int quantity;
  UpdateToCartReq({
    required this.productId,
    required this.quantity,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': productId,
      'quantity': quantity,
    };
  }
}