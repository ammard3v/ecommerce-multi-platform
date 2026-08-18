import 'package:fpdart/fpdart.dart';
import 'package:eshop/core/error/failures.dart';
import 'package:eshop/features/cart/data/source/cart_remote_data_source.dart';
import 'package:eshop/features/cart/data/source/source.dart';
import 'package:eshop/features/notification/data/model/notification_model.dart';
import 'package:eshop/features/notification/data/source/notification_remote_data_source.dart';
import 'package:eshop/features/notification/domain/entity/notification_entity.dart';
import 'package:eshop/features/notification/domain/repository/notification_repository.dart';
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource notificationRemoteDataSource;
  NotificationRepositoryImpl({
    required this.notificationRemoteDataSource,
  });
  @override
  ResultFuture<List<NotificationEntity>> fetchNotifications() async {
    try {
      final response = await notificationRemoteDataSource.fetchNotifications();
      return Right(response.data.toEntityList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error Occured!'));
    }
  }
}