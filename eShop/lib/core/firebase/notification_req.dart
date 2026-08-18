class NotificationReq {
  final String fcmToken;
  final String userId;
  final String appId;
  String? title;
  String? body;
  String? type;
  NotificationReq({
    required this.fcmToken,
    required this.userId,
    this.title,
    this.body,
    this.type,
    required this.appId,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'appId': appId,
      'fcmToken': fcmToken,
      'userId': userId,
      'title': title,
      'body': body,
      'type': type,
    };
  }
}