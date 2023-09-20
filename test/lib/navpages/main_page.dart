import 'package:flutter/material.dart';
import 'package:homepage/home_page.dart';
import 'package:homepage/navpages/habits.dart';
import 'package:homepage/navpages/maps.dart';
import 'package:homepage/navpages/settings.dart';
import 'package:homepage/navpages/watch_conn.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    Habits(),
    WatchConnection(),
    Maps(),
    Settings(),
  ];

  int currentIndex = 0;
  void Ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: Ontap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.pink.shade200,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: ("Home"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: ("HABITS"), icon: Icon(Icons.directions_run)),
          BottomNavigationBarItem(label: ("WATCH"), icon: Icon(Icons.watch)),
          BottomNavigationBarItem(
              label: ("ROUTE"), icon: Icon(Icons.location_on_rounded)),
          BottomNavigationBarItem(
              label: ("Settings"), icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
