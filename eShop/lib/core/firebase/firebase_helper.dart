import 'package:eshop/app/device_id_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:eshop/common/server_call/server_call.dart';
import 'package:eshop/core/firebase/notification_req.dart';
import 'package:eshop/features/auth/data/source/source.dart';
import 'package:eshop/features/user/data/source/user_local_data_source.dart';
abstract class FirebaseHelper {
  Future<void> setupfcm();
}
class FirebaseHelperImpl extends FirebaseHelper {
  final UserLocalDataSource userLocalDataSource;
  final ServerCall serverCall;
  FirebaseHelperImpl({
    required this.userLocalDataSource,
    required this.serverCall,
  });
  @override
  Future<void> setupfcm() async {
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.denied) return;
    final userId = await userLocalDataSource.getUserId();
    if (userId == null) return;
    final fcmToken = await messaging.getToken();
    if (fcmToken == null) return;
    final appId = await getDeviceId();
    final NotificationReq notificationReq =
        NotificationReq(fcmToken: fcmToken, userId: userId, appId: appId);
    await serverCall.sendfcmTokenToBackend(notificationReq);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
  }
}