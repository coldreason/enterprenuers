// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA_NY1NYNYrSmpPzC23_lCGRskzvMX1WTs',
    appId: '1:1074217400307:web:b3c88eda3cb3c257524486',
    messagingSenderId: '1074217400307',
    projectId: 'enterprenuers',
    authDomain: 'enterprenuers.firebaseapp.com',
    storageBucket: 'enterprenuers.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0sQfgwPOjKRniUpTbRrVvEn6OwqsHT9c',
    appId: '1:1074217400307:android:3ae111981fb4be73524486',
    messagingSenderId: '1074217400307',
    projectId: 'enterprenuers',
    storageBucket: 'enterprenuers.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEYjnU8RdlqMuuQzq-Q9spOp1Us0uannA',
    appId: '1:1074217400307:ios:49e4e36e9a70a370524486',
    messagingSenderId: '1074217400307',
    projectId: 'enterprenuers',
    storageBucket: 'enterprenuers.appspot.com',
    iosClientId: '1074217400307-ac8e5n4tfcuqsjqgl99ho3e098duvgis.apps.googleusercontent.com',
    iosBundleId: 'com.example.generative',
  );
}
