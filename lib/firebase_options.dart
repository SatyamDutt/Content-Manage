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
    apiKey: 'AIzaSyAOAqe9ImNncbqL2LPO9wZ4HJkgIORsQTw',
    appId: '1:405621987705:web:500cbe882b1574bac2b7a8',
    messagingSenderId: '405621987705',
    projectId: 'content-manage-deed7',
    authDomain: 'content-manage-deed7.firebaseapp.com',
    storageBucket: 'content-manage-deed7.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdaj3B5pdCCPLFgRuNpc2TFvVTARlnU6Y',
    appId: '1:405621987705:android:0c9f937f938c3074c2b7a8',
    messagingSenderId: '405621987705',
    projectId: 'content-manage-deed7',
    storageBucket: 'content-manage-deed7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgt6jva8tH7p4pfCzBX2JF9nhjGatRVBw',
    appId: '1:405621987705:ios:5c85906ddd473022c2b7a8',
    messagingSenderId: '405621987705',
    projectId: 'content-manage-deed7',
    storageBucket: 'content-manage-deed7.firebasestorage.app',
    iosBundleId: 'com.example.contentManage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgt6jva8tH7p4pfCzBX2JF9nhjGatRVBw',
    appId: '1:405621987705:ios:5c85906ddd473022c2b7a8',
    messagingSenderId: '405621987705',
    projectId: 'content-manage-deed7',
    storageBucket: 'content-manage-deed7.firebasestorage.app',
    iosBundleId: 'com.example.contentManage',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAOAqe9ImNncbqL2LPO9wZ4HJkgIORsQTw',
    appId: '1:405621987705:web:b3d430ef1fb82ba1c2b7a8',
    messagingSenderId: '405621987705',
    projectId: 'content-manage-deed7',
    authDomain: 'content-manage-deed7.firebaseapp.com',
    storageBucket: 'content-manage-deed7.firebasestorage.app',
  );
}
