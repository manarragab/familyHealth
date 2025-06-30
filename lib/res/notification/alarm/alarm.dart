import 'dart:io';

import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
import 'package:abg/res/notification/alarm/alarm_permission.dart';
import 'package:abg/res/notification/push_notification.dart';
import 'package:alarm/alarm.dart';
import 'package:alarm/model/volume_settings.dart';

class CustomAlarm {
  AlarmPermissions permissions = AlarmPermissions();
  LocalNotification notification = LocalNotification();

  addAlarm(AlarmData alarm) async {
    sPrint.info('startAlarm');
    bool isCheck = await permissions.checkPermissions();
    if (isCheck) {
      // String alarmTime = alarm.alarmTime;
// String alarmTime = DateFormat("HH:mm").format(DateFormat("HH:mm:ss").parse(alarm.alarmTime));

      String alarmTimeRaw = alarm.alarmTime;
      late String alarmTime;

      try {
        // Try parsing "HH:mm:ss"
        alarmTime = DateFormat("HH:mm")
            .format(DateFormat("HH:mm:ss").parse(alarmTimeRaw));
      } catch (_) {
        try {
          // Fallback to "HH:mm"
          alarmTime = DateFormat("HH:mm")
              .format(DateFormat("HH:mm").parse(alarmTimeRaw));
        } catch (_) {
          print("Invalid time format");
          // Or handle as needed
        }
      }

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
        startAndroidAlarm(
          alarm.id!.toInt(),
          alarm.userId!.toInt(),
          start,
          end,
          hour,
          minute,
          title: alarm.title ?? "",
          body: alarm.description ?? "",
        );
      }
    } else {
      sPrint.error("permission denied", StackTrace.current);
      showToast("permission denied", MessageErrorType.error);
    }
  }



deleteAlarm(AlarmData alarm) async {
    sPrint.info('startAlarm');
    bool isCheck = await permissions.checkPermissions();
    if (isCheck) {
      // String alarmTime = alarm.alarmTime;
// String alarmTime = DateFormat("HH:mm").format(DateFormat("HH:mm:ss").parse(alarm.alarmTime));

      String alarmTimeRaw = alarm.alarmTime;
      late String alarmTime;

      try {
        // Try parsing "HH:mm:ss"
        alarmTime = DateFormat("HH:mm")
            .format(DateFormat("HH:mm:ss").parse(alarmTimeRaw));
      } catch (_) {
        try {
          // Fallback to "HH:mm"
          alarmTime = DateFormat("HH:mm")
              .format(DateFormat("HH:mm").parse(alarmTimeRaw));
        } catch (_) {
          print("Invalid time format");
          // Or handle as needed
        }
      }

// Split the string at ":"
      List<String> parts = alarmTime.split(":");

// Convert to integers
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      sPrint.success(alarm.toJson());

      DateTime? start = DateTime.parse(alarm.medicineStartDate!);
      DateTime? end = DateTime.tryParse(alarm.medicineEndDate ?? "");

      if (Platform.isIOS) {
        // LocalNotification.scheduleDailyAlarms(
        //   alarm.id!.toInt(),
        //   alarm.userId!.toInt(),
        //   start,
        //   end,
        //   hour,
        //   minute,
        //   title: alarm.title ?? "",
        //   body: alarm.description ?? "",
        // );
      } else {
        
        stopAndroidAlarm(
          alarm.id!.toInt(),
          alarm.userId!.toInt(),
          start,
          end,
          hour,    
          minute,
         
        );
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
  }) async {
    sPrint.info("alarm start $hour $minute");
    endDate = endDate ?? startDate;
    int count = 1;
    DateTime date = DateTime(startDate.year, startDate.month, startDate.day,
        hour, minute, startDate.second);
    do {
      sPrint.info(date.toString());
      final alarmSettings = AlarmSettings(
        id: int.parse("$userID$id$count"),
        dateTime: date,
        assetAudioPath: 'assets/alarm.wav',
        loopAudio: true,
        allowAlarmOverlap: true,
        iOSBackgroundAudio: true,
        vibrate: true,
        androidFullScreenIntent: true,
        warningNotificationOnKill: Platform.isIOS,
        volumeSettings: VolumeSettings.fade(
          volume: 0.8,
          fadeDuration: const Duration(seconds: 2),
          volumeEnforced: true,
        ),
        notificationSettings: NotificationSettings(
          title: title,
          body: body,
          stopButton: 'Stop the alarm',
          icon: 'ic_launcher',
          iconColor: Colors.transparent,
        ),
      );
      await Alarm.set(alarmSettings: alarmSettings);
      date = date.add(const Duration(days: 1));
      sPrint.info('alarm:: $userID$id  $count $date');
      count = count + 1;
      sPrint.info(
          "date.isBefore(endDate) =============> ${date.isBefore(endDate)}  ${date} < ${endDate}");
    } while (date.isBefore(endDate) && count < 10);
    sPrint.success('end alarm');
  }




 stopAndroidAlarm(
    int id,
    int userID,
    DateTime startDate,
    DateTime? endDate,
    int hour,
    int minute,)
     async {
    sPrint.info("alarm start $hour $minute");
    endDate = endDate ?? startDate;
    int count = 1;
    DateTime date = DateTime(startDate.year, startDate.month, startDate.day,
        hour, minute, startDate.second);
    do {
      stopAlarm( int.parse("$userID$id$count"),);
count=count+1;
 } while (date.isBefore(endDate) && count < 10);
    sPrint.success('end alarm');
  }






  void getAllAlarms() {
    sPrint.info('get all alarm');
    Alarm.getAlarms().asStream().listen((value) {
      value.forEach((e) {
        sPrint.warning(e.toJson());
      });
    });
  }

  void clearAll() {
    Alarm.stopAll();
  }
void stopAlarm(int id){
  Alarm.stop(id);
}



  
}

// import 'dart:io';
// import 'package:abg/data/const/export.dart';
// import 'package:abg/data/models/alarm/get_alarms/alarm_model.dart';
// import 'package:abg/res/notification/alarm/alarm_permission.dart';
// import 'package:abg/res/notification/push_notification.dart';
// import 'package:alarm/alarm.dart';
// import 'package:alarm/model/volume_settings.dart';
// import 'package:intl/intl.dart';

// class CustomAlarm {
//   AlarmPermissions permissions = AlarmPermissions();
//   LocalNotification notification = LocalNotification();

//   /// Add main alarm
//   addAlarm(AlarmData alarm) async {
//     sPrint.info('startAlarm');
//     bool isCheck = await permissions.checkPermissions();
//     if (isCheck) {
//       String alarmTimeRaw = alarm.alarmTime;
//       late String alarmTime;

//       try {
//         alarmTime =
//             DateFormat("HH:mm").format(DateFormat("HH:mm:ss").parse(alarmTimeRaw));
//       } catch (_) {
//         try {
//           alarmTime =
//               DateFormat("HH:mm").format(DateFormat("HH:mm").parse(alarmTimeRaw));
//         } catch (_) {
//           print("Invalid time format");
//           return;
//         }
//       }

//       List<String> parts = alarmTime.split(":");
//       int hour = int.parse(parts[0]);
//       int minute = int.parse(parts[1]);

//       sPrint.success(alarm.toJson());

//       DateTime? start = DateTime.tryParse(alarm.medicineStartDate ?? "");
//       DateTime? end = DateTime.tryParse(alarm.medicineEndDate ?? "");

//       if (start == null) {
//         sPrint.error("Invalid start date", StackTrace.current);
//         return;
//       }

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
//     } else {
//       sPrint.error("permission denied", StackTrace.current);
//       showToast("permission denied", MessageErrorType.error);
//     }
//   }

//   /// Start alarm for Android
//   startAndroidAlarm(
//     int id,
//     int userID,
//     DateTime startDate,
//     DateTime? endDate,
//     int hour,
//     int minute, {
//     String title = "",
//     String body = "",
//   }) async {
//     sPrint.info("alarm start $hour:$minute");

//     endDate = endDate ?? startDate;
//     int count = 1;
//     DateTime date =
//         DateTime(startDate.year, startDate.month, startDate.day, hour, minute);

//     do {
//       final alarmSettings = AlarmSettings(
//         id: int.parse("$userID$id$count"),
//         dateTime: date,
//         assetAudioPath: 'assets/alarm.wav',
//         loopAudio: true,
//         allowAlarmOverlap: true,
//         iOSBackgroundAudio: true,
//         vibrate: true,
//         androidFullScreenIntent: true,
//         warningNotificationOnKill: Platform.isIOS,
//         volumeSettings: VolumeSettings.fade(
//           volume: 0.8,
//           fadeDuration: const Duration(seconds: 2),
//           volumeEnforced: true,
//         ),
//        notificationSettings: NotificationSettings(
//   title: title,
//   body: body,
//   stopButton: 'Stop the alarm',

//   snoozeButton: 'Snooze 5 min', // ⏰ زر الغفوة
//   icon: 'ic_launcher',
//   iconColor: Colors.transparent,
// ),

//       );

//       await Alarm.set(alarmSettings: alarmSettings);

//       sPrint.info('alarm:: $userID$id  $count $date');
//       count++;
//       date = date.add(const Duration(days: 1));
//     } while (date.isBefore(endDate) && count < 10);

//     sPrint.success('end alarm');
//   }

//   /// 🔁 Snooze alarm by 5 minutes
//   Future<void> snoozeAlarm(AlarmSettings currentAlarm, {int minutes = 5}) async {
//     DateTime snoozeTime = DateTime.now().add(Duration(minutes: minutes));

//     final snoozeSettings = AlarmSettings(
//       id: currentAlarm.id + 9999,
//       dateTime: snoozeTime,
//       assetAudioPath: currentAlarm.assetAudioPath,
//       loopAudio: currentAlarm.loopAudio,
//       allowAlarmOverlap: currentAlarm.allowAlarmOverlap,
//       iOSBackgroundAudio: currentAlarm.iOSBackgroundAudio,
//       vibrate: currentAlarm.vibrate,
//       androidFullScreenIntent: currentAlarm.androidFullScreenIntent,
//       warningNotificationOnKill: currentAlarm.warningNotificationOnKill,
//       volumeSettings: currentAlarm.volumeSettings,
//       notificationSettings: currentAlarm.notificationSettings!.copyWith(
//         title: "Snoozed: ${currentAlarm.notificationSettings?.title ?? ''}",
//         body: "This is a snoozed alarm",
//       ),
//     );

//     await Alarm.set(alarmSettings: snoozeSettings);
//     sPrint.success("Snoozed alarm set for ${snoozeTime.toLocal()}");
//   }

//   void getAllAlarms() {
//     sPrint.info('get all alarms');
//     Alarm.getAlarms().asStream().listen((value) {
//       for (var e in value) {
//         sPrint.warning(e.toJson());
//       }
//     });
//   }

//   void clearAll() {
//     Alarm.stopAll();
//     sPrint.success('All alarms stopped');
//   }
// }
