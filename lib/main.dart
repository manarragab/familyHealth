import 'package:abg/res/injection.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'firebase_options.dart';
import 'my_app.dart';

/*

flutter build web --target=lib/main.dart --pwa-strategy=none --base-href /course_site/
cp -R build/web/* websites/course_site

* */*/
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

  initializeDateFormatting();
  await init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
/*//   getVersion();
  initData.server = '';
  initData.icon = 'assets/images/logo/drops_splash.svg';
  initData.title = 'Katarat';
  initData.color = const Color(0xff33BAF7);*/
  runApp(const MyApp());
}
