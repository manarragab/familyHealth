import 'package:abg/res/injection.dart';
import 'package:device_preview/device_preview.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import 'firebase_options.dart';
import 'my_app.dart';
import 'res/notification/alarm/alarm.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("handler a background message ${message.messageId}");
  print("payload background ${message.data}");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  CustomAlarm.init();
  if (message.data['type'] == 'alarm') {
    CustomAlarm.showAlarmNotification(
        title: message.data['title'],
        message: message.data['body'],
        id: message.data['id']);
  }
  print('A bg message just showed up :  ${message.messageId}');
}

// this will be used as notification channel id
const notificationChannelId = 'my_foreground';

// this will be used for notification id, So you can update your custom notification with this id.
const notificationId = 888;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  initializeDateFormatting();
  await init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  CustomAlarm.init();
  // await Alarm.init();
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => const MyApp(),
    ),
  );
}
