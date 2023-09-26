import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UI/welcome_page.dart';
import 'package:myapp/UI/main_page.dart';
import 'package:myapp/UI/admin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
              return const MainPage();
            }
          } else {
            return const Welcome();
          }
        },
      ),
    );
  }
}

