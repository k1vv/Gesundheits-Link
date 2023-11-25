import 'package:flutter/material.dart';
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
      create: (context) => HabitProvider(), // Initialize your provider here
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesundheits Link',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final User? user = snapshot.data;
          const adminid = "q38Pju8MufZvgKSF2AqyJYZYGqF2";
          if (user != null) {
            if (user.uid == adminid) {
              return const AdminPage();
            } else {
              return const MainPage(initialIndex: 0,);
            }
          } else {
            return const Welcome();
          }
        },
      ),
    );
  }
}

