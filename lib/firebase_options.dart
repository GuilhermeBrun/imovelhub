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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDw3qu91Stb7oxquqvCFgP8qkagEh3UC_4',
    appId: '1:804490421349:android:835a69dcecb73e490d928c',
    messagingSenderId: '804490421349',
    projectId: 'imovelhub-db7da',
    databaseURL: 'https://imovelhub-db7da-default-rtdb.firebaseio.com',
    storageBucket: 'imovelhub-db7da.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCw2vwvfKR7JfL0ctYEz-ay66xw2y8hcgI',
    appId: '1:804490421349:ios:a9b8bbba5de5f4260d928c',
    messagingSenderId: '804490421349',
    projectId: 'imovelhub-db7da',
    databaseURL: 'https://imovelhub-db7da-default-rtdb.firebaseio.com',
    storageBucket: 'imovelhub-db7da.appspot.com',
    iosBundleId: 'com.example.imovelhub',
  );
}
