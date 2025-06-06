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
    apiKey: 'AIzaSyCTuKsXGFsFJ6eB1HKpqLPLGpU42o6YA6g',
    appId: '1:226303691541:web:b73ebabff8e3c761f1f71c',
    messagingSenderId: '226303691541',
    projectId: 'chat-7601b',
    authDomain: 'chat-7601b.firebaseapp.com',
    storageBucket: 'chat-7601b.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-5fb0armYgeTYgeEF4AGc2UotuGudWEw',
    appId: '1:226303691541:android:77deeac570536fd2f1f71c',
    messagingSenderId: '226303691541',
    projectId: 'chat-7601b',
    storageBucket: 'chat-7601b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABaaPsySKVEPaWu3Mhmlwhre25pQeNa8M',
    appId: '1:226303691541:ios:cf01c0bcc5ac5272f1f71c',
    messagingSenderId: '226303691541',
    projectId: 'chat-7601b',
    storageBucket: 'chat-7601b.firebasestorage.app',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABaaPsySKVEPaWu3Mhmlwhre25pQeNa8M',
    appId: '1:226303691541:ios:cf01c0bcc5ac5272f1f71c',
    messagingSenderId: '226303691541',
    projectId: 'chat-7601b',
    storageBucket: 'chat-7601b.firebasestorage.app',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCTuKsXGFsFJ6eB1HKpqLPLGpU42o6YA6g',
    appId: '1:226303691541:web:582c48a52efc8c3bf1f71c',
    messagingSenderId: '226303691541',
    projectId: 'chat-7601b',
    authDomain: 'chat-7601b.firebaseapp.com',
    storageBucket: 'chat-7601b.firebasestorage.app',
  );
}
