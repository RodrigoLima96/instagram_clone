// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBERtuFlvEwrXrLCprorfsA-htKlDDBG4w',
    appId: '1:97437094525:web:aa4bbcaca550e0261cd714',
    messagingSenderId: '97437094525',
    projectId: 'instagram-clone-fe18f',
    authDomain: 'instagram-clone-fe18f.firebaseapp.com',
    storageBucket: 'instagram-clone-fe18f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfdBb0gyOp5aS97ZnO37mmZtiv8AfJa5k',
    appId: '1:97437094525:android:6ee67124abb244d31cd714',
    messagingSenderId: '97437094525',
    projectId: 'instagram-clone-fe18f',
    storageBucket: 'instagram-clone-fe18f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBK3FR09BvaYaOEW2jNFRvTBmGwH5yvsqw',
    appId: '1:97437094525:ios:6a499c0bad01d57a1cd714',
    messagingSenderId: '97437094525',
    projectId: 'instagram-clone-fe18f',
    storageBucket: 'instagram-clone-fe18f.appspot.com',
    iosClientId: '97437094525-5ngvcqe75hnhe2d5j8mk6lpdosv29bov.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagram',
  );
}
