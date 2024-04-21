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
    apiKey: 'AIzaSyBSAHBxFwa6VmOFxurto4ua2-n3esGeWtU',
    appId: '1:585969882388:web:b5570a2e8e5c923a8bde01',
    messagingSenderId: '585969882388',
    projectId: 'expense-manager-642fd',
    authDomain: 'expense-manager-642fd.firebaseapp.com',
    storageBucket: 'expense-manager-642fd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0m9B--ErK9nKLWBZc-ePOdUcmN2eZR70',
    appId: '1:585969882388:android:bc75c5c3ecc600008bde01',
    messagingSenderId: '585969882388',
    projectId: 'expense-manager-642fd',
    storageBucket: 'expense-manager-642fd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCccGyif2HsBtwjLcP21Eukp17eXvOAsII',
    appId: '1:585969882388:ios:8992424f1f674cc08bde01',
    messagingSenderId: '585969882388',
    projectId: 'expense-manager-642fd',
    storageBucket: 'expense-manager-642fd.appspot.com',
    iosBundleId: 'com.example.assessmentApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCccGyif2HsBtwjLcP21Eukp17eXvOAsII',
    appId: '1:585969882388:ios:f140bea970721a248bde01',
    messagingSenderId: '585969882388',
    projectId: 'expense-manager-642fd',
    storageBucket: 'expense-manager-642fd.appspot.com',
    iosBundleId: 'com.example.assessmentApplication1.RunnerTests',
  );
}