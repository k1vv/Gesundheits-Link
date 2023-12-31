// ignore_for_file: constant_identifier_names, prefer_final_fields, must_be_immutable, unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:myapp/UI/Health/bloodoxygen_page.dart';
import 'package:myapp/UI/Health/calories_page.dart';
import 'package:myapp/UI/Health/sleeptracking_page.dart';
import 'package:myapp/UI/Health/steps_page.dart';
import 'package:provider/provider.dart';
import 'package:myapp/UI/Main/main_page.dart';
import 'package:myapp/UI/Admin/admin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/UI/Habits/notification.dart';
import 'package:myapp/UI/Welcome/welcome_page.dart';
import 'package:myapp/UI/Habits/habit_provider.dart';
import 'package:myapp/UI/Habits/notification_scheduler.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  await LocalNotifications.init();
  await NotificationScheduler.scheduleNotifications();

  runApp(
    ChangeNotifierProvider(
      create: (context) => HabitProvider(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Gesundheits Link',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routes: {
        'calories_page': (context) => const CaloriesPage(),
        'steps_page': (context) => const StepsPage(),
        'bloodoxygen_page': (context) => const BloodOxygenPage(),
        'sleeptracker_page': (context) => const SleepPage(),
      },
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final User? user = snapshot.data;
          const adminid = "xhtAad07b9TI1eszEGSegP3BTrx1";
          if (user != null) {
            if (user.uid == adminid) {
              return const AdminPage();
            } else {
              
              requestNotificationPermissions();
              return const MainPage(initialIndex: 0,);
            }
          } else {
            requestNotificationPermissions();
            return const Welcome();
          }
        },
      ),
    );
  }
  void requestNotificationPermissions() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // ignore: prefer_const_declarations
    final AndroidNotificationDetails androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your_channel_id',
      'Your channel name',
      importance: Importance.high,
      priority: Priority.high,
    );
    // ignore: unused_local_variable
    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(alert: true, badge: true, sound: true);
  }
}

