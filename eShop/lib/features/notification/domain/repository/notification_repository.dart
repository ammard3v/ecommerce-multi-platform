import '../../../../core/usecase/typedef.dart';
import '../entity/notification_entity.dart';
abstract class NotificationRepository {
  ResultFuture<List<NotificationEntity>> fetchNotifications();
}