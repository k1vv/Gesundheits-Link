import 'package:flutter/material.dart';
import 'package:admin_2/navbar.dart';

//import 'navbar.dart'; // Make sure to import navbar.dart correctly

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: NavBar(), // Use NavBar() to create the drawer
        appBar: AppBar(
          title: const Text('Admin Page'),
          backgroundColor: Colors.pink,
        ),
        body: const Center(
          child: Text('Main Page'),
        ),
      ),
    );
  }
}
