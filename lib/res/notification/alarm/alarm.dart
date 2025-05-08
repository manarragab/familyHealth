// import 'dart:convert';
// import 'dart:io';

// import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
// import 'package:abg/res/configuration/print_types.dart';
// import 'package:abg/res/configuration/toast_utils.dart';
// import 'package:abg/res/notification/alarm/alarm_permission.dart';
// import 'package:abg/res/notification/push_notification.dart';
// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:receive_intent/receive_intent.dart';

// class CustomAlarm {
//   AlarmPermissions permissions = AlarmPermissions();
//   LocalNotification notification = LocalNotification();

//   addAlarm(AlarmData alarm) async {
//     sPrint.info('startAlarm');
//     bool isCheck = await permissions.checkPermissions();
//     if (!isCheck) {
//       sPrint.error("Permission denied", StackTrace.current);
//       showToast("Permission denied", MessageErrorType.error);
//       return;
//     }

//     DateTime alarmDateTime = DateTime.parse("${alarm.alarmDate} ${alarm.alarmTime}:00");
//     int hour = alarmDateTime.hour;
//     int minute = alarmDateTime.minute;

//     DateTime start = DateTime.parse(alarm.medicineStartDate!);
//     DateTime end = DateTime.tryParse(alarm.medicineEndDate ?? "") ?? start;

//     if (Platform.isIOS) {
//       LocalNotification.scheduleDailyAlarms(
//         alarm.id!.toInt(),
//         alarm.userId!.toInt(),
//         start,
//         end,
//         hour,
//         minute,
//         title: alarm.title ?? "",
//         body: alarm.description ?? "",
//       );
//     } else {
//       startAndroidAlarm(
//         alarm.id!.toInt(),
//         alarm.userId!.toInt(),
//         start,
//         end,
//         hour,
//         minute,
//         title: alarm.title ?? "",
//         body: alarm.description ?? "",
//       );
//     }
//   }

//   startAndroidAlarm(
//     int id,
//     int userID,
//     DateTime startDate,
//     DateTime endDate,
//     int hour,
//     int minute, {
//     String title = "",
//     String body = "",
//   }) {
//     DateTime alarmTime = DateTime(startDate.year, startDate.month, startDate.day, hour, minute);

//     AndroidAlarmManager.oneShotAt(
//       alarmTime,
//       int.parse("$userID$id"),
//       getCallBack,
//       alarmClock: true,
//       wakeup: true,
//       rescheduleOnReboot: true,
//       params: {'id': "$userID$id", 'title': title, 'body': body},
//     );

//     sPrint.success("Alarm set for \$alarmTime");
//   }
// }

// @pragma('vm:entry-point')
// void getCallBack() async {
//   final receivedIntent = await ReceiveIntent.getInitialIntent();
//   String title = "Alarm";
//   String body = "It's time!";

//   if (receivedIntent?.extra != null) {
//     final id = receivedIntent?.extra?["id"];
//     final paramsExtra = receivedIntent?.extra?["params"] ?? jsonEncode(receivedIntent?.extra);
//     final params = jsonDecode(paramsExtra);
//     title = params['title'] ?? title;
//     body = params['body'] ?? body;

//     final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     const androidDetails = AndroidNotificationDetails(
//       'daily_alarm_channel',
//       'Daily Alarm Notifications',
//       importance: Importance.high,
//       priority: Priority.high,
//       icon: '@mipmap/ic_launcher',
//       sound: RawResourceAndroidNotificationSound('alarm'),
//       playSound: true,
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       const InitializationSettings(
//         android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       ),
//     );

//     await flutterLocalNotificationsPlugin.show(
//       int.tryParse(id?.toString() ?? "0") ?? 0,
//       title,
//       body,
//       NotificationDetails(android: androidDetails),
//     );

//     sPrint.success("Alarm notification triggered: \$title - \$body");
//   }
// }








// import 'dart:convert';
// import 'dart:io';
// import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
// import 'package:abg/res/notification/alarm/alarm_permission.dart';
// import 'package:abg/res/notification/push_notification.dart';
// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:receive_intent/receive_intent.dart';

// class CustomAlarm {
//   final AlarmPermissions permissions = AlarmPermissions();
//   final LocalNotification notification = LocalNotification();

//   Future<void> addAlarm(AlarmData alarm) async {
//     bool granted = await permissions.checkPermissions();
//     if (!granted) return;

//     try {
//       final DateTime alarmDateTime = DateTime.parse(
//         "${alarm.alarmDate} ${alarm.alarmTime}:00",
//       );

//       final start = DateTime.parse(alarm.medicineStartDate!);
//       final end = alarm.medicineEndDate != null
//           ? DateTime.parse(alarm.medicineEndDate!)
//           : start;

//       int hour = alarmDateTime.hour;
//       int minute = alarmDateTime.minute;

//       if (Platform.isIOS) {
//         LocalNotification.scheduleDailyAlarms(
//           alarm.id!.toInt(),
//           alarm.userId!.toInt(),
//           start,
//           end,
//           hour,
//           minute,
//           title: alarm.title ?? "",
//           body: alarm.description ?? "",
//         );
//       } else {
//         startAndroidAlarm(
//           alarm.id!.toInt(),
//           alarm.userId!.toInt(),
//           start,
//           end,
//           hour,
//           minute,
//           title: alarm.title ?? "",
//           body: alarm.description ?? "",
//         );
//       }
//     } catch (e) {
//       print("❌ Error in addAlarm: $e");
//     }
//   }

//   void startAndroidAlarm(
//     int id,
//     int userId,
//     DateTime startDate,
//     DateTime endDate,
//     int hour,
//     int minute, {
//     String title = "",
//     String body = "",
//   }) {
//     int count = 1;
//     DateTime currentDate = startDate;

//     while (!currentDate.isAfter(endDate)) {
//       final DateTime scheduledTime = DateTime(
//         currentDate.year,
//         currentDate.month,
//         currentDate.day,
//         hour,
//         minute,
//       );

//       if (scheduledTime.isAfter(DateTime.now())) {
//         AndroidAlarmManager.oneShotAt(
//           scheduledTime,
//           int.parse("$userId$id$count"),
//           getCallBack,
//           alarmClock: true,
//           wakeup: true,
//           rescheduleOnReboot: true,
//           params: {
//             'title': title,
//             'body': body,
//             'id': "$userId$id$count",
//           },
//         );
//       }

//       currentDate = currentDate.add(const Duration(days: 1));
//       count++;
//     }
//   }
// }

// @pragma('vm:entry-point')
// void getCallBack() async {
//   final intent = await ReceiveIntent.getInitialIntent();

//   String title = "Alarm";
//   String body = "Wake up!";
//   String id = "999";

//   if (intent != null && intent.extra != null) {
//     final extras = intent.extra!;
//     if (extras.containsKey("title")) title = extras["title"];
//     if (extras.containsKey("body")) body = extras["body"];
//     if (extras.containsKey("id")) id = extras["id"].toString();
//   }

//   final plugin = FlutterLocalNotificationsPlugin();
//   LocalNotification.initialize(plugin, backgroundNotificationHandler);

//   const androidDetails = AndroidNotificationDetails(
//     'daily_alarm_channel',
//     'Daily Alarm Notifications',
//     importance: Importance.high,
//     priority: Priority.high,
//     icon: '@mipmap/ic_launcher',
//     sound: RawResourceAndroidNotificationSound('alarm'), // alarm.wav in res/raw
//   );

//   await plugin.show(
//     int.tryParse(id) ?? 999,
//     title,
//     body,
//     NotificationDetails(android: androidDetails),
//   );
// }

// @pragma('vm:entry-point')
// void backgroundNotificationHandler(NotificationResponse notificationResponse) async {
//   print("Notification clicked in background: ${notificationResponse.payload}");
// }




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
    print("alarmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
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
          alarm.userId!.toInt(),
          start,
          end,
          hour,
          minute,
          title: alarm.title ?? "",
          body: alarm.description ?? "",
        );
      } else {
        startAndroidAlarm(alarm.id!.toInt(),alarm.userId!.toInt(), start, end, hour, minute);
      }
    } else {
      sPrint.error("permission denied", StackTrace.current);
      showToast("permission denied", MessageErrorType.error);
    }
  }

  startAndroidAlarm(
      int id,
      int userID,
      DateTime startDate,
      DateTime? endDate,
      int hour,
      int minute, {
        String title = "",
        String body = "",
      }) {
    sPrint.info("alarm start");
    endDate = endDate ?? startDate;
    DateTime start = startDate;
    int count = 1;
    do {
      DateTime date = DateTime(startDate.year, startDate.month, startDate.day,
          hour, minute, startDate.second);
      sPrint.info(date.toString());
      AndroidAlarmManager.oneShotAt(
        date,
        int.parse("$userID$id$count"),
        getCallBack,
        alarmClock: true,
        wakeup: true,
        rescheduleOnReboot: true,
        params: {'title': title, 'body': body},
      );
      count = count + 1;
      start = start.add(const Duration(days: 1));
      sPrint.info('alarm:: $userID$id  $count $start');
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
  sPrint.info("intent:: ${receivedIntent?.action}");
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
    playSound: true
  );
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  LocalNotification.initialize(
      flutterLocalNotificationsPlugin, backgroundNotificationHandler);
  var notificationDetails = NotificationDetails(android:androidDetails);

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