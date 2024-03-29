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
    apiKey: "AIzaSyCIsi0NvdVUBDbtvVQm7I-FEuuta8DMNHY",
    appId: '1:313882767540:android:f8b3b825051762bd5c27e1',
    messagingSenderId: '35253988660 ',
    projectId: 'e-commerce-56778',
    databaseURL:
        "https://e-commerce-56778-default-rtdb.firebaseio.com/",
    storageBucket: "tourguide-8657f.appspot.com",
    measurementId: 'G-M4QT5PH0HJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIsi0NvdVUBDbtvVQm7I-FEuuta8DMNHY',
    appId: '1:313882767540:android:f8b3b825051762bd5c27e1',
    messagingSenderId: '35253988660 ',
    projectId: 'e-commerce-56778',
    databaseURL:
        'https://e-commerce-56778-default-rtdb.firebaseio.com//',
    storageBucket: 'tourguide-8657f.appspot.com',
    measurementId: 'G-M4QT5PH0HJ',
  );
}
