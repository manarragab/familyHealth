import 'package:abg/res/injection.dart';
import 'package:device_preview/device_preview.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'firebase_options.dart';
import 'my_app.dart';
import 'package:timezone/data/latest_all.dart' as tz;



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("handler a background message ${message.messageId}");
  print("payload background ${message.data}");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print('A bg message just showed up :  ${message.messageId}');
}

// this will be used as notification channel id
const notificationChannelId = 'my_foreground';

// this will be used for notification id, So you can update your custom notification with this id.
const notificationId = 888;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ✅ Initialize Timezone before using `tz.local`
  tz.initializeTimeZones();

  initializeDateFormatting();
  await init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await AndroidAlarmManager.initialize();
/*//   getVersion();
  initData.server = '';
  initData.icon = 'assets/images/logo/drops_splash.svg';
  initData.title = 'Katarat';
  initData.color = const Color(0xff33BAF7);*/
  runApp(

    DevicePreview(
      enabled: kDebugMode,

      builder: (context) => const MyApp(),
    ),
  );
}
