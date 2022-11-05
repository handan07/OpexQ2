import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

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
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDl5VJVB2nGQEeaKOYZ3UswPjhPKHoMar4',
    authDomain: 'react-native-firebase-testing.firebaseapp.com',
    databaseURL: 'https://opex-b293f.firebaseio.com',
    projectId: 'opex-b293f',
    storageBucket: 'opex-b293f.appspot.com',
    messagingSenderId: '992702129785',
    appId: '1:992702129785:ios:857022d0f214f6aa3b16a8',
    measurementId: 'G-0N1G9FLDZE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDl5VJVB2nGQEeaKOYZ3UswPjhPKHoMar4',
    appId: '1:992702129785:ios:857022d0f214f6aa3b16a8',
    messagingSenderId: '992702129785',
    projectId: 'opex-b293f',
    databaseURL: 'https://opex-b293f.firebaseio.com',
    storageBucket: 'opex-b293f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDl5VJVB2nGQEeaKOYZ3UswPjhPKHoMar4',
    appId: '1:992702129785:ios:857022d0f214f6aa3b16a8',
    messagingSenderId: '992702129785',
    projectId: 'opex-b293f',
    databaseURL: 'https://opex-b293f.firebaseio.com',
    storageBucket: 'opex-b293f.appspot.com',
    androidClientId:
        '448618578101-a9p7bj5jlakabp22fo3cbkj7nsmag24e.apps.googleusercontent.com',
    iosClientId:
        '448618578101-evbjdqq9co9v29pi8jcua8bm7kr4smuu.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.plugins.firebase.messaging',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDl5VJVB2nGQEeaKOYZ3UswPjhPKHoMar4',
    appId: '1:992702129785:ios:857022d0f214f6aa3b16a8',
    messagingSenderId: '992702129785',
    projectId: 'opex-b293f',
    databaseURL: 'https://opex-b293f.firebaseio.com',
    storageBucket: 'opex-b293f.appspot.com',
    androidClientId:
        '448618578101-a9p7bj5jlakabp22fo3cbkj7nsmag24e.apps.googleusercontent.com',
    iosClientId:
        '448618578101-evbjdqq9co9v29pi8jcua8bm7kr4smuu.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.plugins.firebase.messaging',
  );
}
