import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notification/InternetconectionScreens.dart';

import 'NotificationScreens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onMessage.listen(showFlutterNotification);
  runApp(const MyApp());
}

void showFlutterNotification(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null) {
    var title = notification.title.toString();
    var body = notification.body.toString();
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 150,
            channelKey: "normal",
            title: 'hello!',
            body: "goodmorining"));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: InternetconectionScreens(title: 'Internet Connectivity'),
    );
  }
}
