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
        vibrate: true,
        warningNotificationOnKill: Platform.isIOS,
        volumeSettings: VolumeSettings.fade(
          volume: 0.8,
          fadeDuration: const Duration(seconds: 5),
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
      sPrint.info("date.isBefore(endDate) =============> ${date.isBefore(endDate)}  ${date} < ${endDate}");
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
}
