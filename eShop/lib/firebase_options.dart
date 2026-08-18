import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCImbYLCFXuZ4Atu8sKyFW4SlGIrOvkng0',
    appId: '1:919466299050:web:ac839e318a879eb0868ad3',
    messagingSenderId: '919466299050',
    projectId: 'project-ecommerce-156de',
    authDomain: 'project-ecommerce-156de.firebaseapp.com',
    storageBucket: 'project-ecommerce-156de.firebasestorage.app',
    measurementId: 'G-N4C3C169VP',
  );
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCI7kYFavsUp9VgJXI3XKfPcfbgyVXJrVc',
    appId: '1:919466299050:android:dbc4e97ee663e612868ad3',
    messagingSenderId: '919466299050',
    projectId: 'project-ecommerce-156de',
    storageBucket: 'project-ecommerce-156de.firebasestorage.app',
  );
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJW7TLq5mBIdUWghEm-2f8diekvFufuIY',
    appId: '1:919466299050:ios:05f7d8dc3a632b32868ad3',
    messagingSenderId: '919466299050',
    projectId: 'project-ecommerce-156de',
    storageBucket: 'project-ecommerce-156de.firebasestorage.app',
    androidClientId:
        '919466299050-5melol57lcl7fh9q1dfhodihdv8io1l7.apps.googleusercontent.com',
    iosClientId:
        '919466299050-smibjkorfghp602a8djevodsua9fe55s.apps.googleusercontent.com',
    iosBundleId: 'com.ammar.eshop',
  );
}