<<<<<<< HEAD
import 'package:admin_example/navbar.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        backgroundColor: Colors.pink,
      ),
      drawer: NavBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
              child: Container(
                width: 398,
                height: 136,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 154, 183),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                        child: Text(
                          'Health Connection Status :',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Switch.adaptive(
                      value: switchValue,
                      onChanged: (newValue) {
                        setState(() {
                          switchValue = newValue;
                        });
                      },
                      activeColor: Color(0xFF39EF3E),
                      activeTrackColor: Colors.green,
                      inactiveTrackColor: Colors.red,
                      inactiveThumbColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.pinkAccent, Colors.pinkAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    switchValue ? "TRUE" : "FALSE",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
=======
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
>>>>>>> 699419a5a0b75e76718d28d3febf3fe2a7377adc
      ),
    );
  }
}
<<<<<<< HEAD
=======

>>>>>>> 699419a5a0b75e76718d28d3febf3fe2a7377adc
