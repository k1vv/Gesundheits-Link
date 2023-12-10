// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:myapp/UI/Main/home_page.dart';
import 'package:myapp/UI/Main/habit_page.dart';
import 'package:myapp/UI/Main/maps_page.dart';
import 'package:myapp/UI/Main/accountsetting_page.dart';
import 'package:myapp/UI/Main/smartwatch_page.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;
  const MainPage({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomePage(),
          Habits(),
          WatchConnection(),
          ShowMaps(),
          Settings(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.transparent))),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.pink.shade200,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            const BottomNavigationBarItem(label: "HABITS", icon: Icon(Icons.directions_run)),
            BottomNavigationBarItem(
              label: "WATCH",
              icon: Image.asset(
                "assets/images/watch.png",
                width: 60,
                height: 60,
              ),
            ),
            const BottomNavigationBarItem(label: "ROUTE", icon: Icon(Icons.location_on_rounded)),
            const BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
