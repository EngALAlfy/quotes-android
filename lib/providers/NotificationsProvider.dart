import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:quotes_app/providers/BaseProvider.dart';
import 'package:quotes_app/utils/Config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsProvider extends BaseProvider {
  String newQuotesTopic = "newTopic";
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationsProvider(context) {
    init();

    try {
      FirebaseMessaging().subscribeToTopic(newQuotesTopic);
      FirebaseMessaging().getToken().then((value) {
        Dio().post(Config.API_URL + "/users/add/token", data: {"token": value});
      });
    } catch (e) {
      catchError(context, e);
    }
  }

  init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notifications');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging().configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showNotification(
            message["notification"]["title"], message["notification"]["body"]);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  showNotification(title, body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('0', 'fcm', 'fcm notifications',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics);
  }
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  print(message);
}
