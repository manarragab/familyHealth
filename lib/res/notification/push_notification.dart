import 'package:abg/res/notification/alarm/alarm.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';

import '../configuration/print_types.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

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
         if (message.data['type'] != null &&
            message.data['type'] == 'alarm') {
          CustomAlarm.showAlarmNotification(
              title: message.data['title'],
              message: message.data['body'],
              id: message.data['id']);
              print("alarmmmmmmmmmmmmm ${message.data['title']}");
        } else if (notification != null) {
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
          print("testyyyyyyyyyyyyyyyy ${message.notification?.title}");
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
        android: AndroidInitializationSettings('mipmap/ic_launcher'),
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
      'com.mint.android',
      playSound: true,
      //   sound: const RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
    );

    var not = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: const DarwinNotificationDetails());
    await fln.show(id, title, body, not, payload: payload);
  }

  requestAlarmNotification() {
    Permission.scheduleExactAlarm.request();
    Permission.criticalAlerts.request();
  }

  static Future<void> scheduleDailyAlarms(
    int id,
    int userID,
    DateTime startDate,
    DateTime? endDate,
    int hour,
    int minute, {
    String title = "",
    String body = "",
  }) async {
    tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime start = tz.TZDateTime.from(startDate, tz.local);
    tz.TZDateTime end = tz.TZDateTime.from(endDate ?? startDate, tz.local);

    // Ensure start date is in the future
    if (start.isBefore(now)) {
      start =
          tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    }

    sPrint.warning('localNotification:: ${start.toString()}');

    sPrint.info("alarm start");
    int count = 1;
    do {
      DateTime date = DateTime(startDate.year, startDate.month, startDate.day,
          hour, minute, startDate.second);
      sPrint.info(date.toString());
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id++, // Unique Notification ID
        title,
        body,
        start,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'daily_alarm_channel',
            'Daily Alarm Notifications',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
            sound: RawResourceAndroidNotificationSound('alarm'),
          ),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
      );
      count = count + 1;
      start = start.add(const Duration(days: 1));
      sPrint.info('alarm:: $userID$id  $count $start');
    } while (start.isBefore(end) && false);
    sPrint.success('end alarm');
  }
}
