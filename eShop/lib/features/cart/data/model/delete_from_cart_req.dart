class DeleteFromCartReq {
  final String productId;
  DeleteFromCartReq({
    required this.productId,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': productId,
    };
  }
}