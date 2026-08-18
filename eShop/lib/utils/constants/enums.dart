enum UserRole { admin, user }
enum OrderByGroup { active, completed, canceled }
enum OrderItemStatus { pending, confirmed, shipped, delivered, canceled }
extension OrderItemStatusX on OrderItemStatus {
  String get label => '${name[0].toUpperCase()}${name.substring(1)}';
}
enum PaymentMethod { COD, STRIPE, BANK, EWALLET }
enum PaymentStatus { pending, paid, failed, refunded }