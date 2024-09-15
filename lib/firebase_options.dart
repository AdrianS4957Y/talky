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
    apiKey: 'AIzaSyDGXFn2_AWAvlEUvZNXufFISAMmYtBXUwU',
    appId: '1:335802907028:web:f53280868e9223ae097781',
    messagingSenderId: '335802907028',
    projectId: 'talky-by-adrians4957y',
    authDomain: 'talky-by-adrians4957y.firebaseapp.com',
    storageBucket: 'talky-by-adrians4957y.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcbWRYKAvyCq2CkjI6fSSD46aeMMxsgAk',
    appId: '1:335802907028:android:80e0683eb664ba21097781',
    messagingSenderId: '335802907028',
    projectId: 'talky-by-adrians4957y',
    storageBucket: 'talky-by-adrians4957y.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbf4dgJYhImtt1Vlx9j27ECd6RG7w3wt4',
    appId: '1:335802907028:ios:e2c2c5215b2d4777097781',
    messagingSenderId: '335802907028',
    projectId: 'talky-by-adrians4957y',
    storageBucket: 'talky-by-adrians4957y.appspot.com',
    iosBundleId: 'com.example.talky',
  );
}
