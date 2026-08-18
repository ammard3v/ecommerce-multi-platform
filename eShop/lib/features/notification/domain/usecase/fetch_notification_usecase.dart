import '../../../../core/routes/route_barel.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/notification_entity.dart';
import '../repository/notification_repository.dart';
class FetchNotificationUsecase
    implements UseCaseWithoutParams<List<NotificationEntity>> {
  final NotificationRepository notificationRepository;
  const FetchNotificationUsecase(this.notificationRepository);
  @override
  ResultFuture<List<NotificationEntity>> call() async {
    return await notificationRepository.fetchNotifications();
  }
}