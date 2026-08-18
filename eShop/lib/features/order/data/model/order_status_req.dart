class OrderStatusReq {
  final String orderId;
  final String itemId;
  OrderStatusReq({
    required this.orderId,
    required this.itemId,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'itemId': itemId,
    };
  }
}