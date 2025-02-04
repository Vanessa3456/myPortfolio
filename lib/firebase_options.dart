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
    apiKey: 'AIzaSyBcwVIow0wWPOCyTnyJeEjk7BP-3hFaStA',
    appId: '1:462410921598:web:d39cb2c4f395a13d1cca2f',
    messagingSenderId: '462410921598',
    projectId: 'personalsite-a6a5b',
    authDomain: 'personalsite-a6a5b.firebaseapp.com',
    storageBucket: 'personalsite-a6a5b.firebasestorage.app',
    measurementId: 'G-XB5YM1B9TB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxCRCh7CBgTJVefHS2LlW8JL7Do_ePoVk',
    appId: '1:462410921598:android:d3e1f3ffdf561d921cca2f',
    messagingSenderId: '462410921598',
    projectId: 'personalsite-a6a5b',
    storageBucket: 'personalsite-a6a5b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIo97xV0B1tFZJSIb0f5akd47fmTa2vqE',
    appId: '1:462410921598:ios:f1ea4997220341261cca2f',
    messagingSenderId: '462410921598',
    projectId: 'personalsite-a6a5b',
    storageBucket: 'personalsite-a6a5b.firebasestorage.app',
    iosBundleId: 'com.example.portfolio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDIo97xV0B1tFZJSIb0f5akd47fmTa2vqE',
    appId: '1:462410921598:ios:f1ea4997220341261cca2f',
    messagingSenderId: '462410921598',
    projectId: 'personalsite-a6a5b',
    storageBucket: 'personalsite-a6a5b.firebasestorage.app',
    iosBundleId: 'com.example.portfolio',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBcwVIow0wWPOCyTnyJeEjk7BP-3hFaStA',
    appId: '1:462410921598:web:28760e48172b67bc1cca2f',
    messagingSenderId: '462410921598',
    projectId: 'personalsite-a6a5b',
    authDomain: 'personalsite-a6a5b.firebaseapp.com',
    storageBucket: 'personalsite-a6a5b.firebasestorage.app',
    measurementId: 'G-FM4SHXC8XK',
  );
}
