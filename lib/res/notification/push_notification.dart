import 'package:abg/data/const/enums.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../configuration/print_types.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

/*  final notificationController = Get.isRegistered<FcmNotificationController>()
      ? Get.put(FcmNotificationController())
      : Get.find<FcmNotificationController>();*/

  bool showNotification = true;

  subscribe(String id) {
    sPrint.info('alarm:: $id');
    firebaseMessaging.subscribeToTopic(id);
  }

  unSubscribe(String id) {
    firebaseMessaging.unsubscribeFromTopic(id);
  }

  getNotification() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        sPrint.info('getMessage::: $message');
        RemoteNotification? notification = message.notification;
        if (notification != null) {
          // foreground
          sPrint.info('notificationMessage::::${message.notification!.title}');
          sPrint.info('notificationMessage::::${message.notification!.body}');
          sPrint.info('notificationMessageData::::${message.data}');
          var notificationController; //= Get.put(NotificationController());
          notificationController?.updateFirebaseNotification(true);
          showNotificationSnackBar(
            payload: "",
            title: message.notification?.title ?? "",
            message: message.notification?.body ?? "",
            onReceive: (p0) {},
          );
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      sPrint.info('getMessage::: $message');
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        // back ground click
        sPrint.info('notificationMessage::::${message.notification!.title}');
        sPrint.info('notificationMessage::::${message.notification!.body}');
        sPrint.info('notificationMessageData::::${message.data}');
        // notificationController.getNotificationData(message.data);
      }
    });
    sPrint.info('start request permission');
    firebaseMessaging.requestPermission(
        sound: true, badge: true, alert: true, provisional: true);
  }

  Future<void> requestNotificationPermissions() async {
    final settings = await firebaseMessaging.getNotificationSettings();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      await firebaseMessaging.requestPermission();
    }
  }

  void _launchPowerUsageSettings() async {
    const url =
        'package:com.android.settings/com.android.settings.fuelgauge.PowerUsageSummary';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<String?> getNotificationToken() {
    return firebaseMessaging.getToken().then((String? token) {
      sPrint.info('token - fcm token :: //$token//');
      return token;
    });
  }

  static void showNotificationSnackBar({
    required String title,
    required String message,
    required String payload,
    required void Function(NotificationResponse) onReceive,
  }) async {
    /*Get.snackbar(title, message,
        icon: icon, onTap: onTap, duration: const Duration(seconds: 3));*/
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    bool? showNotification = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    sPrint.info('show notification:: $showNotification');
    if (showNotification == true) {
      LocalNotification.showBigTextNotification(
          title: title,
          body: message,
          fln: flutterLocalNotificationsPlugin,
          payload: payload);
    } else {
      Get.snackbar(title, message, duration: const Duration(seconds: 3));
    }
  }
}

class LocalNotification {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      void Function(NotificationResponse) onReceive) async {
    var initializationsSettings = const InitializationSettings(
        android: AndroidInitializationSettings('mipmap/launcher_icon'),
        iOS: DarwinInitializationSettings());
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings,
        onDidReceiveBackgroundNotificationResponse: onReceive,
        onDidReceiveNotificationResponse: onReceive);
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      title,
      'com.benzol.co.benzol.android',
      playSound: true,
      //   sound: const RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/launcher_icon',
      largeIcon: const DrawableResourceAndroidBitmap('@mipmap/launcher_icon'),
    );

    var not = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: const DarwinNotificationDetails());
    await fln.show(id, title, body, not, payload: payload);
  }
}
