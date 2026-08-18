import '../firebase/firebase_helper.dart';
import 'service_locater.dart';
Future firebaseInjection() async {
  sl.registerLazySingleton<FirebaseHelper>(() => FirebaseHelperImpl(
        serverCall: sl(),
        userLocalDataSource: sl(),
      ));
}