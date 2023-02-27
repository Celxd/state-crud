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
    apiKey: 'AIzaSyAaGyPniM6HjdbIn5wDgEroyBTGBNgMrPc',
    appId: '1:317125753660:web:c65036367e87ae8c9ffc39',
    messagingSenderId: '317125753660',
    projectId: 'state-crud',
    authDomain: 'state-crud.firebaseapp.com',
    storageBucket: 'state-crud.appspot.com',
    measurementId: 'G-N8VM5PX309',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCp7KArGB0TSs__68oWinK5kL0cfOBIZc',
    appId: '1:317125753660:android:6e670ee04e8363fa9ffc39',
    messagingSenderId: '317125753660',
    projectId: 'state-crud',
    storageBucket: 'state-crud.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBILWCQo8GjuZaxcDxenwFM2qxo0zzBjO8',
    appId: '1:317125753660:ios:09f0820253f264039ffc39',
    messagingSenderId: '317125753660',
    projectId: 'state-crud',
    storageBucket: 'state-crud.appspot.com',
    androidClientId: '317125753660-srh1qk7ob640fb28j8f1bjik4b2ubeep.apps.googleusercontent.com',
    iosClientId: '317125753660-1kig2g63mb3n82uqoh3628fu9oothcf0.apps.googleusercontent.com',
    iosBundleId: 'com.example.state',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBILWCQo8GjuZaxcDxenwFM2qxo0zzBjO8',
    appId: '1:317125753660:ios:09f0820253f264039ffc39',
    messagingSenderId: '317125753660',
    projectId: 'state-crud',
    storageBucket: 'state-crud.appspot.com',
    androidClientId: '317125753660-srh1qk7ob640fb28j8f1bjik4b2ubeep.apps.googleusercontent.com',
    iosClientId: '317125753660-1kig2g63mb3n82uqoh3628fu9oothcf0.apps.googleusercontent.com',
    iosBundleId: 'com.example.state',
  );
}
