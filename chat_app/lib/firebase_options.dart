// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDTkMuA05UllxdHP23fQ3shcCikVjtpH44',
    appId: '1:127947415079:web:067d4105ff77f7f1d97802',
    messagingSenderId: '127947415079',
    projectId: 'chat-app-flutter-a2b9a',
    authDomain: 'chat-app-flutter-a2b9a.firebaseapp.com',
    storageBucket: 'chat-app-flutter-a2b9a.appspot.com',
    measurementId: 'G-302VDY58QL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDS_E4n5POf06ez4yGhCKOBp2yj4N9Bgk',
    appId: '1:127947415079:android:a5dda18da4676629d97802',
    messagingSenderId: '127947415079',
    projectId: 'chat-app-flutter-a2b9a',
    storageBucket: 'chat-app-flutter-a2b9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiwGLOwYpdvfaXsuuRTPg-x7KHb3tvGdc',
    appId: '1:127947415079:ios:624c64611a21ff0bd97802',
    messagingSenderId: '127947415079',
    projectId: 'chat-app-flutter-a2b9a',
    storageBucket: 'chat-app-flutter-a2b9a.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiwGLOwYpdvfaXsuuRTPg-x7KHb3tvGdc',
    appId: '1:127947415079:ios:624c64611a21ff0bd97802',
    messagingSenderId: '127947415079',
    projectId: 'chat-app-flutter-a2b9a',
    storageBucket: 'chat-app-flutter-a2b9a.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDTkMuA05UllxdHP23fQ3shcCikVjtpH44',
    appId: '1:127947415079:web:4bd5687b95859acfd97802',
    messagingSenderId: '127947415079',
    projectId: 'chat-app-flutter-a2b9a',
    authDomain: 'chat-app-flutter-a2b9a.firebaseapp.com',
    storageBucket: 'chat-app-flutter-a2b9a.appspot.com',
    measurementId: 'G-EV2Q3E08W3',
  );
}
