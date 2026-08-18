import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:eshop/features/notification/domain/entity/notification_entity.dart';
import 'package:eshop/features/notification/domain/usecase/fetch_notification_usecase.dart';
abstract class NotificationState {}
class NotificationInitial extends NotificationState {}
class NotificationLoading extends NotificationState {}
class NotificationLoaded extends NotificationState {
  final List<NotificationEntity> notificationEntity;
  NotificationLoaded({
    required this.notificationEntity,
  });
}
class NotificationFailure extends NotificationState {
  final String message;
  NotificationFailure({
    required this.message,
  });
}
class NotificationCubit extends Cubit<NotificationState> {
  final FetchNotificationUsecase fetchNotificationUsecase;
  NotificationCubit({
    required this.fetchNotificationUsecase,
  }) : super(NotificationInitial());
  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    final result = await fetchNotificationUsecase.call();
    result.fold((l) => emit(NotificationFailure(message: l.message)),
        (r) => emit(NotificationLoaded(notificationEntity: r)));
  }
}