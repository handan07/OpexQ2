import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:opexq/utils/utils.dart';


class AppController extends GetxController {

  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void onInit() {
    loadMenu();
    super.onInit();
  }

  void loadMenu() async {
    setupFCM();
    //getFcmToken();
  }

  // goToMenu(String name) {
  //   Menu item = menuData.singleWhere((element) => element.name == name);
  //   //goTo(item);
  // }

  // goToHelpMenu() {
  //   Menu item = menuData.singleWhere((element) => element.name == "Services");
  //   //goTo(item);
  // }

  // goToHotelMenu() {
  //   Menu item = menuData.singleWhere((element) => element.name == "Hotel");
  //   //goTo(item);
  // }

  

  Map<String, dynamic>? convertMessage(RemoteMessage message) {
    try {
      if (Platform.isIOS) {
        return {
          'title': "aa", //message['notification']['title'],
          'body': "bb", //message['notification']['body'],
          'order_id': "cc", //message['data']['order_id'],
          'status': "sdd" //message['data']['status'],
        };
        // 'title': message['aps']['alert']['title'],
        // 'body': message['aps']['alert']['body'],
        // 'order_id': message['order_id'],
        // 'status': message['status'],

        // {
        //   "aps" : {
        //     "alert" : {
        //       "body" : "great match!",
        //       "title" : "Portugal vs. Denmark",
        //     },
        //     "badge" : 1,
        //   },
        //   "customKey" : "customValue"
        // }

      } else {
        return {
          'title': "aa", //message['notification']['title'],
          'body': "aa", //message['notification']['body'],
          'order_id': "aa", // message['data']['order_id'],
          'status': "aa" //message['data']['status'],
        };
      }
    } catch (e) {
      return null;
    }
  }

  setupFCM() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('notification');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    // final IOSInitializationSettings initializationSettingsIOS =
    //     IOSInitializationSettings(requestAlertPermission: false,requestBadgePermission: false,requestSoundPermission: false,
    //  );

    // final InitializationSettings initializationSettings = InitializationSettings(
    //   android: initializationSettingsAndroid,
    //   iOS: initializationSettingsIOS,
    // );

//     NotificationSettings settings = await messaging.requestPermission(
//   alert: true,
//   announcement: false,
//   badge: true,
//   carPlay: false,
//   criticalAlert: false,
//   provisional: false,
//   sound: true,
// );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//   print('User granted permission');
// } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//   print('User granted provisional permission');
// } else {
//   print('User declined or has not accepted permission');
// }

    if (Platform.isIOS) {
      FirebaseMessaging.instance.requestPermission(
          sound: true,
          badge: true,
          alert: true,
          provisional: false,
          announcement: true,
          carPlay: true);
    }

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Get.toNamed('/message', arguments: MessageArguments(message, true));
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        showNotification(message.notification!.title ?? "",
            message.notification!.body ?? "", android.imageUrl);
        // flutterLocalNotificationsPlugin.show(
        //     notification.hashCode,
        //     notification.title, // Title of our notification
        //     notification.body, // Body of our notification
        //     NotificationDetails(
        //       android: AndroidNotificationDetails(
        //         // This is the channel we use defined above
        //         channel.id,
        //         channel.name,
        //         channel.description,
        //         //The icon is defined in android/app/src/main/res/drawable
        //         icon: 'notification',
        //       ),
        //     ),
        //     //We parse the data from the field view to the callback
        //     //Line 58
        //     payload: message.data["view"]);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //print('A new onMessageOpenedApp event was published!');
      Map<String, dynamic>? convertedMessage = convertMessage(message);
      if (convertedMessage != null) {}
      //Get.toNamed('/message', arguments: MessageArguments(message, true));
    });
  }
}

class MessageArguments {
  /// The RemoteMessage
  final RemoteMessage message;

  /// Whether this message caused the application to open.
  final bool openedApplication;

  // ignore: public_member_api_docs
  MessageArguments(this.message, this.openedApplication);
}
