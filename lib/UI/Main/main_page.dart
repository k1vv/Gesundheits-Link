import 'package:flutter/material.dart';
import 'package:myapp/UI/Main/home_page.dart';
import 'package:myapp/UI/Main/habit_page.dart';
import 'package:myapp/UI/Main/maps_page.dart';
import 'package:myapp/UI/Main/accountsetting_page.dart';
import 'package:myapp/UI/Main/smartwatch_page.dart';

class MainPage extends StatefulWidget {
  final int initialIndex;
  const MainPage({Key? key,this.initialIndex = 0}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    const HomePage(),
    const Habits(),
    const WatchConnection(),
    const ShowMaps(),
    const Settings(),
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(57, 0, 0, 0)
            )
          )
        ),
        child: BottomNavigationBar(
      
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
      ),
    );
  }
}