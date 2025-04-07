import 'package:abg/data/const/export.dart';
import 'package:alarm/alarm.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';

class AlarmPermissions {
  static final _log = Logger('AlarmPermissions');
  static Future<bool> checkNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status.isDenied) {
      _log.info('Requesting notification permission...');
      final res = await Permission.notification.request();
      _log.info(
        'Notification permission ${res.isGranted ? '' : 'not '}granted',
      );
      if (res.isGranted) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }
  static Future<bool> checkAndroidExternalStoragePermission() async {
    final status = await Permission.manageExternalStorage.request();
    if (status.isDenied) {
      _log.info('Requesting external storage permission...');
      final res = await Permission.manageExternalStorage.request();
      _log.info(
        'External storage permission ${res.isGranted ? '' : 'not'} granted',
      );
      if (res.isGranted) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }

  static Future<bool> checkAndroidScheduleExactAlarmPermission() async {
    final status = await Permission.scheduleExactAlarm.status;
    _log.info('Schedule exact alarm permission: $status.');
    if (status.isDenied) {
      _log.info('Requesting schedule exact alarm permission...');
      final res = await Permission.scheduleExactAlarm.request();
      _log.info(
        'Schedule exact alarm permission ${res.isGranted ? '' : 'not'} granted',
      );
      if (res.isGranted) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }

  Future<bool> checkPermissions() async {
    late bool check;
    check = await checkNotificationPermission();
    if (!check) {
      sPrint.warning('checkNotificationPermission permission:: notification');
      return check;
    }
  //  check = await checkAndroidExternalStoragePermission();
  //  if (!check) {
  //    sPrint.warning('checkAndroidExternalStoragePermission permission:: notification');
  //    return check;
  //  }
    if (Alarm.android) {
      check = await checkAndroidScheduleExactAlarmPermission();
      if (!check) {
        sPrint.warning('checkAndroidExternalStoragePermission permission:: notification');
        return check;
      }
    }
    return check;
  }
}
