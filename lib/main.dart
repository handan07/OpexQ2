// ignore_for_file: require_trailing_commas
// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
//import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/get.dart';
import 'package:opexq/bindings/app_binding.dart';
import 'package:opexq/pages/unknown/unknown_view.dart';
import 'package:opexq/routes.dart';
import 'package:opexq/services/services.dart';
import 'package:opexq/services/storage_service.dart';
import 'package:opexq/theme/app_theme.dart';
import 'package:opexq/utils/dictionary.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  //print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  HttpOverrides.global = DevHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.init();
  await Firebase.initializeApp();

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'OpexQ Application',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        //transitionDuration: Duration.,
        //smartManagement: SmartManagement.onlyBuilder,
        //smartManagement: SmartManagement.keepFactory,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        // routingCallback: (routing) async {
        //   print(routing?.route);
        //   if (routing?.current == AppRoutes.TRAY ||
        //       routing?.current == AppRoutes.WAKEUP) {
        //     await checkLogin();
        //   }
        //   //print(routing?.previous);
        // },
        //navigatorObservers: [NavigationHistoryObserver()],
        initialRoute:
            Get.find<StorageService>().endPoint == "" ? "/signUp" : "/home",
        unknownRoute:
            GetPage(name: '/notfound', page: () => const UnknownView()),
        getPages: routes(),
        locale: Get.find<StorageService>().languageCode == "tr"
            ? const Locale('tr', 'TR')
            : const Locale('en', 'UK'), // ui.window.locale,
        supportedLocales: const [
          Locale('en', 'UK'),
          Locale('tr', 'TR'),
          Locale('de', 'DE'),
          Locale('ru', 'RU')
        ],
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        fallbackLocale: const Locale('en', 'UK'),
        //translations: Dictionary(),
        translationsKeys: Get.find<Dictionary>().keys,
        translations: Get.find<Dictionary>(),
        initialBinding: AppBinding());
  }
}

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
