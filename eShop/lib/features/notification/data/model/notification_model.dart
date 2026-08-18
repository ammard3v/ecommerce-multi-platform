import '../../domain/entity/notification_entity.dart';
class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required super.user,
    required super.title,
    required super.body,
    required super.type,
    required super.read,
    required super.sentAt,
    required super.id,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user': user,
      'id': id,
      'title': title,
      'body': body,
      'type': type,
      'read': read,
      'sent_at': sentAt.millisecondsSinceEpoch,
    };
  }
  factory NotificationModel.fromJson(Map<String, dynamic> map) {
    return NotificationModel(
      user: map['user'] as String,
      id: map['id'] as String,
      title: map['title'] as String,
      body: map['body'] as String,
      type: map['type'] as String,
      read: map['read'] as bool,
      sentAt: DateTime.parse(map['sent_at'] as String),
    );
  }
}
extension NotificationModelX on NotificationModel {
  NotificationEntity toEntity() {
    return NotificationEntity(
      user: user,
      title: title,
      body: body,
      type: type,
      read: read,
      sentAt: sentAt,
      id: id,
    );
  }
}
extension NotificationModelListX on List<NotificationModel> {
  List<NotificationEntity> toEntityList() =>
      map((value) => value.toEntity()).toList();
}