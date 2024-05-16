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
    apiKey: 'AIzaSyDFby_8zl__p6ScLS6NlgmUjcfwrNbZgmg',
    appId: '1:723697751771:android:9b7eb4fc90ea5449ae5efe',
    messagingSenderId: '723697751771',
    projectId: 'masusc-bd020',
    databaseURL: 'https://masusc-bd020-default-rtdb.firebaseio.com',
    storageBucket: 'masusc-bd020.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKadDaeqPiP9CdJSMNVxAOPcRDjdagjvI',
    appId: '1:723697751771:ios:943567ba5e48b829ae5efe',
    messagingSenderId: '723697751771',
    projectId: 'masusc-bd020',
    databaseURL: 'https://masusc-bd020-default-rtdb.firebaseio.com',
    storageBucket: 'masusc-bd020.appspot.com',
    androidClientId: '723697751771-jikt95sb9v42aa8bc7tec2v2g44cndmd.apps.googleusercontent.com',
    iosClientId: '723697751771-n3p18vso5ej38sj952o5uuragsqq6k7v.apps.googleusercontent.com',
    iosBundleId: 'com.example.masusc',
  );
}