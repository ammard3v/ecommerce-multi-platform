import 'package:equatable/equatable.dart';
class NotificationEntity extends Equatable {
  final String user;
  final String title;
  final String body;
  final String type;
  final bool read;
  final DateTime sentAt;
  final String id;
  const NotificationEntity({
    required this.user,
    required this.title,
    required this.body,
    required this.type,
    required this.read,
    required this.sentAt,
    required this.id,
  });
  @override
  List<Object?> get props => [user, title, body, type, read, sentAt, id];
}