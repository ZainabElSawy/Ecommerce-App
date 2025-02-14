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
        return macos;
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
    apiKey: 'AIzaSyAPtOeWkxD_jMLCCLduJM3BzDHFamx1BZI',
    appId: '1:553912183544:web:dd0ebbd4b614d7df3ea90d',
    messagingSenderId: '553912183544',
    projectId: 'ecommerce-69b4a',
    authDomain: 'ecommerce-69b4a.firebaseapp.com',
    storageBucket: 'ecommerce-69b4a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdZyjE5vqa8LPTpq7d8s6torvI8x79GlI',
    appId: '1:553912183544:android:a7eae8185be210a73ea90d',
    messagingSenderId: '553912183544',
    projectId: 'ecommerce-69b4a',
    storageBucket: 'ecommerce-69b4a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDy5nPmTD688sYOZPnuonlGPdzGihoNNls',
    appId: '1:553912183544:ios:a7402ee51f63edb93ea90d',
    messagingSenderId: '553912183544',
    projectId: 'ecommerce-69b4a',
    storageBucket: 'ecommerce-69b4a.appspot.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDy5nPmTD688sYOZPnuonlGPdzGihoNNls',
    appId: '1:553912183544:ios:b86bbb8c687c79913ea90d',
    messagingSenderId: '553912183544',
    projectId: 'ecommerce-69b4a',
    storageBucket: 'ecommerce-69b4a.appspot.com',
    iosBundleId: 'com.example.ecommerceApp.RunnerTests',
  );
}
