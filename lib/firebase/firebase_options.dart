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
    apiKey: 'AIzaSyDEZ913LQ3iBBeIGEL4uGujKB2CrK5mtLI',
    appId: '1:1061994818039:web:d9e5a5fae023a908c626f2',
    messagingSenderId: '1061994818039',
    projectId: 'instagram-6613a',
    authDomain: 'instagram-6613a.firebaseapp.com',
    storageBucket: 'instagram-6613a.appspot.com',
    measurementId: 'G-1HDE0X955M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwTt3IVdjUARSVqTVWy1v3u6El7JtOFcY',
    appId: '1:1061994818039:android:63f374369c292b47c626f2',
    messagingSenderId: '1061994818039',
    projectId: 'instagram-6613a',
    storageBucket: 'instagram-6613a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBQGW7Li4PeWi56NtIU9tCLxsAFjHmVO4',
    appId: '1:1061994818039:ios:e452f905f7cfbb0bc626f2',
    messagingSenderId: '1061994818039',
    projectId: 'instagram-6613a',
    storageBucket: 'instagram-6613a.appspot.com',
    iosClientId: '1061994818039-ejrcm5miko3vvhkrdbovc8lbn54jn6co.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagramClone',
  );
}
