import 'dart:io';
import 'dart:isolate';

import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/res/notification/alarm/alarm_permission.dart';
import 'package:abg/res/notification/push_notification.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:receive_intent/receive_intent.dart';
import 'dart:convert'; // for jsonDecode

class CustomAlarm {
  AlarmPermissions permissions = AlarmPermissions();
  LocalNotification notification = LocalNotification();

  addAlarm(AlarmData alarm) async {
    sPrint.info('startAlarm');
    bool isCheck = await permissions.checkPermissions();
    if (isCheck) {
      String alarmTime = alarm.alarmTime;

// Split the string at ":"
      List<String> parts = alarmTime.split(":");

// Convert to integers
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      sPrint.success(alarm.toJson());

      DateTime? start = DateTime.parse(alarm.medicineStartDate!);
      DateTime? end = DateTime.tryParse(alarm.medicineEndDate ?? "");

      if (Platform.isIOS) {
        LocalNotification.scheduleDailyAlarms(
          alarm.id!.toInt(),
          start,
          end,
          hour,
          minute,
          title: alarm.title ?? "",
          body: alarm.description ?? "",
        );
      } else {
        startAndroidAlarm(alarm.id!.toInt(), start, end, hour, minute);
      }
    } else {
      sPrint.error("permission denied", StackTrace.current);
      showToast("permission denied", MessageErrorType.error);
    }
  }

  startAndroidAlarm(
    int id,
    DateTime startDate,
    DateTime? endDate,
    int hour,
    int minute, {
    String title = "",
    String body = "",
  }) {
    sPrint.info("alarm start");
    endDate = endDate ?? startDate;
    sPrint.info(
        'start date:: $startDate  end data :: $endDate  ${startDate.isBefore(endDate)}');
    do {
      DateTime date = DateTime(startDate.year, startDate.month, startDate.day,
          hour, minute, startDate.second);
      sPrint.info(date.toString());
      AndroidAlarmManager.oneShotAt(
        date,
        1234547,
        getCallBack,
        alarmClock: true,
        wakeup: true,
        rescheduleOnReboot: true,
        params: {'title': title, 'body': body},
      );
    } while (startDate.isBefore(endDate) && false);
    sPrint.success('end alarm');
  }
// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0
}

@pragma('vm:entry-point')
getCallBack() async {
  final receivedIntent = await ReceiveIntent.getInitialIntent();
  String title = "Alarm";
  String body = "Wake up!";
  if (receivedIntent?.action == "android.intent.action.MAIN") {
    final paramsExtra = receivedIntent?.extra?["params"];
    if (paramsExtra != null) {
      // The received params is a string, so we need to convert it into a json map
      final params = jsonDecode(paramsExtra);
      // use params
      title = params['title'];
      body = params['body'];
    }
  }
  final id = receivedIntent?.extra?["id"];
  // navigate user to alarm with given id
  var androidDetails = const AndroidNotificationDetails(
    'daily_alarm_channel', // Channel ID
    'Daily Alarm Notifications', // Channel Name
    importance: Importance.high,
    priority: Priority.high,
    icon: '@mipmap/ic_launcher', // ✅ Ensure this is set properly
    sound: RawResourceAndroidNotificationSound('alarm'), // Custom sound
  );
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  LocalNotification.initialize(
      flutterLocalNotificationsPlugin, backgroundNotificationHandler);
  var notificationDetails = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    int.tryParse(id?.toString() ?? "") ?? 2135465,
    title,
    body,
    notificationDetails,
  );

  sPrint.info('alarm end');
}

// 🛑 Ensure this function is a top-level function (outside any class)
@pragma('vm:entry-point')
void backgroundNotificationHandler(
    NotificationResponse notificationResponse) async {
  print("Background notification clicked: ${notificationResponse.payload}");
}
