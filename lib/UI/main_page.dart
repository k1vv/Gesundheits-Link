import 'package:flutter/material.dart';
import 'package:myapp/UI/home_page.dart';
import 'package:myapp/UI/habit_page.dart';
import 'package:myapp/UI/map.dart';
import 'package:myapp/UI/accountsetting_page.dart';
import 'package:myapp/UI/smartwatch.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    const HomePage(),
    const Habits(),
    const WatchConnection(),
    const Maps(),
    const Settings(),
  ];

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
      body: Column(
        children: 
        [
          Expanded(
            child: pages[currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: const Color.fromARGB(255, 241, 241, 241),     
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.pink.shade200,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items:  [
          const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          const BottomNavigationBarItem(label: "HABITS", icon: Icon(Icons.directions_run)),
          BottomNavigationBarItem(label: "WATCH", icon: Image.asset("assets/images/watch.png", width: 60,height: 60,)),
          const BottomNavigationBarItem(label: "ROUTE", icon: Icon(Icons.location_on_rounded)),
          const BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}