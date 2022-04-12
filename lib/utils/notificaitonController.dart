import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationController{

  var notificationCount = 0;

  Future<bool> initialize() async {
    // Firebase 초기화부터 해야 Firebase Messaging 을 사용할 수 있다.
    await Firebase.initializeApp();

    // Android 에서는 별도의 확인 없이 리턴되지만, requestPermission()을 호출하지 않으면 수신되지 않는다.

    await FirebaseMessaging.instance.subscribeToTopic('sos');

    // iOS foreground에서 heads up display 표시를 위해 alert, sound true로 설정
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    // Android용 새 Notification Channel
    const AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
      'high_importance_channel', // 임의의 id
      'High Importance Notifications', // 설정에 보일 채널명 설정에 보일 채널 설명
      importance: Importance.max,
    );

    // Notification Channel을 디바이스에 생성
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);

    // FlutterLocalNotificationsPlugin 초기화. 이 부분은 notification icon 부분에서 다시 다룬다.
    await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'), iOS: IOSInitializationSettings()),
        onSelectNotification: (String? payload) async {

        });

    FirebaseMessaging.onMessage.listen((RemoteMessage rm) {
      RemoteNotification? notification = rm.notification;
      AndroidNotification? android = rm.notification?.android;

      if (notification != null && android != null) {
        notificationCount++;
        print("notification count : ${notificationCount}");
        var rng = new Random();
        flutterLocalNotificationsPlugin.show(
          rng.nextInt(notificationCount),
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel', // 임의의 id
              'High Importance Notifications', // 설정에 보일 채널명// other properties...
            ),
          ),
        );
      }
    });

    return true;
  }
}